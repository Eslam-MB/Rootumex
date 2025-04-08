import 'package:flutter/material.dart';

class Mainwrapper extends StatelessWidget {
  const Mainwrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Text(
            "ROOTUMEX",
            style: TextStyle(
                fontSize: 25, fontFamily: "Inter", fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(child: child),
    );
  }
}
