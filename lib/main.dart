import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rootumex/screens/auth_screens/login_screen.dart';
import 'package:rootumex/screens/home_screen.dart';
import 'package:rootumex/screens/receive_screens/receive_screen.dart';
import 'package:rootumex/widgets/mainwrapper_widget.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/receive',
      builder: (context, state) => const Mainwrapper(child: ReceiveScreen()),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff143D60)),
          fontFamily: 'Nunito Sans',
          scaffoldBackgroundColor: const Color(0xffFDFCFA),
          inputDecorationTheme: InputDecorationTheme(
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(14)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(14)),
            ),
            contentPadding: const EdgeInsets.all(8),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(color: Color(0xff143D60), width: 2),
            ),
          ),
          primaryColor: const Color(0xff143D60),
          filledButtonTheme: FilledButtonThemeData(
              style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(const Color(0xff143D60)),
          ))),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
