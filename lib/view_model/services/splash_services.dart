import 'package:flutter/material.dart';
import 'package:mvvm_app/model/user_model.dart';
import 'package:mvvm_app/utils/routes.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuth(BuildContext context) async {
    getUserData().then((value) async {
      debugPrint(value.token);
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 1),
            () => Navigator.pushReplacementNamed(context, MyRoutes.loginRoute));
      } else {
        await Future.delayed(const Duration(seconds: 1),
            () => Navigator.pushReplacementNamed(context, MyRoutes.homeRoute));
      }
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }
}
