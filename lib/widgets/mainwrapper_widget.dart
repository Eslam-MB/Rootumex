import 'package:flutter/material.dart';

class Mainwrapper extends StatelessWidget {
  const Mainwrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text(
            "ROOTUMEX",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "Inter",
                fontWeight: FontWeight.w900,
                color: Color(0xff143D60)),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(minimum: const EdgeInsets.all(8), child: child),
    );
  }
}
