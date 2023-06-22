import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes.dart';
import 'package:mvvm_app/view/home_page.dart';
import 'package:mvvm_app/view/login_page.dart';
import 'package:mvvm_app/view/signup_page.dart';
import 'package:mvvm_app/view/splash_screen.dart';
import 'package:mvvm_app/view_model/auth_view_model.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthviewProvider()),
        ChangeNotifierProvider(create: (context) => UserViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.splashRoute,
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.signUpRoute: (context) => const SignUpPage(),
        MyRoutes.splashRoute: (context) => const Splash(),
      },
    );
  }
}
