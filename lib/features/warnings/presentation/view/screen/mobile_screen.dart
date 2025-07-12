import 'package:flutter/material.dart';

import '../widgets/body.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Warning")),
      backgroundColor: Colors.red.shade50,
      body: const Body(),
    );
  }
}
