import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            child: const SizedBox(
              height: 30,
              width: 100,
              child: Text('Click Me'),
            ),
          ),
        ],
      ),
    );
  }
}
