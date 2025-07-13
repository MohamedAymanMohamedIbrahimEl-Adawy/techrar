import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "vpn_proxy_channel", binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call, result) in
        if call.method == "isUsingVPN" {
            result(self.isVPNConnected())
        } else if call.method == "isUsingProxy" {
            result(self.isProxyEnabled())
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func isVPNConnected() -> Bool {
      var addresses = [String]()

      var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
      if getifaddrs(&ifaddr) == 0 {
          var ptr = ifaddr
          while ptr != nil {
              let name = String(cString: ptr!.pointee.ifa_name)
              if name.contains("utun") || name.contains("ppp") {
                  return true
              }
              ptr = ptr!.pointee.ifa_next
          }
          freeifaddrs(ifaddr)
      }
      return false
  }

  private func isProxyEnabled() -> Bool {
      guard let proxySettings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any] else {
          return false
      }
      if let httpEnable = proxySettings["HTTPEnable"] as? Int, httpEnable == 1 {
          return true
      }
      if let httpsEnable = proxySettings["HTTPSEnable"] as? Int, httpsEnable == 1 {
          return true
      }
      return false
  }
}
