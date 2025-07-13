package com.example.techrar
import android.os.Bundle
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.net.NetworkInterface

class MainActivity : FlutterActivity() {
    private val CHANNEL = "vpn_proxy_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            when (call.method) {
                "isUsingVPN" -> result.success(isVPNActive())
                "isUsingProxy" -> result.success(isProxyUsed())
                else -> result.notImplemented()
            }
        }
    }

    private fun isVPNActive(): Boolean {
        val interfaces = NetworkInterface.getNetworkInterfaces()
        for (intf in interfaces) {
            if (intf.name.contains("tun") || intf.name.contains("ppp")) {
                return true
            }
        }
        return false
    }

    private fun isProxyUsed(): Boolean {
        val proxyHost = System.getProperty("http.proxyHost")
        val proxyPort = System.getProperty("http.proxyPort")
        return !proxyHost.isNullOrEmpty() && proxyPort != null
    }
}
