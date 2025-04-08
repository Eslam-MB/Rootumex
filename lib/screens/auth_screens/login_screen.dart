import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
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
              ),
              const SizedBox(height: 50),
              const Text(
                "Welcome to Rootumex WM app",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 30),
              const Text(
                "Username",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Write your username',
                ),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 25),
              const Text(
                "Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 7),
              TextField(
                obscureText: isObscured,
                decoration: InputDecoration(
                  hintText: 'Write your password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    child: isObscured
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                ),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              // const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FilledButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
