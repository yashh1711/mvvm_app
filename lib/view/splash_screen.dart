import 'package:flutter/material.dart';
import 'package:mvvm_app/view_model/services/splash_services.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashServices splash = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash.checkAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Splash Screen',
                style: Theme.of(context).textTheme.headlineLarge),
          )
        ],
      ),
    );
  }
}
