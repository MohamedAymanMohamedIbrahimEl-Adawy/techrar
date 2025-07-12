
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpn_connection_detector/vpn_connection_detector.dart';

final vpnGuardProvider = FutureProvider<bool>((ref) async {
  final isVpnActive = await VpnConnectionDetector.isVpnActive();
  return isVpnActive;
});
