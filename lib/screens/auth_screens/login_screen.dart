import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ROOTUMEX",
              style: TextStyle(
                  fontSize: 36,
                  color: Color(0xff143D60),
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w900),
            ),
          ],
        )
      ],
    );
  }
}
