import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/services/network/vpn/vpn_proxy_checker.dart';

class Body extends ConsumerWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.warning, size: 60, color: Colors.red),
            SizedBox(height: 16),
            Text(
              'vpnOrProxyDetected'.tr(),
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'pleaseDisableVpnOrProxy'.tr(),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: () {
                ref.invalidate(vpnGuardProvider);
              },
              icon: Icon(Icons.refresh, size: 36),
            ),
          ],
        ),
      ),
    );
  }
}
