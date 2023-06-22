import 'package:flutter/material.dart';
import 'package:mvvm_app/model/user_model.dart';
import 'package:mvvm_app/repository/auth_repository.dart';
import 'package:mvvm_app/utils/routes.dart';
import 'package:mvvm_app/utils/utils.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthviewProvider with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setRegisterLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.login(data).then((value) {
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(token: value['token'].toString()));
      setLoading(false);
      Utils.flushBarComplete('User Login Sucessfull', context);

      Future.delayed(const Duration(seconds: 1),
          () => Navigator.pushReplacementNamed(context, MyRoutes.homeRoute));

      debugPrint(value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarError(error.toString(), context);
      debugPrint(error.toString());
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setRegisterLoading(true);
    _myRepo.signUp(data).then((value) {
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(token: value['token'].toString()));
      setRegisterLoading(false);
      Utils.flushBarComplete('User Registered Sucessfully', context);
      Future.delayed(
        const Duration(seconds: 1),
        () {
          Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
        },
      );

      debugPrint(value.toString());
    }).onError((error, stackTrace) {
      setRegisterLoading(false);
      Utils.flushBarError(error.toString(), context);
      debugPrint(error.toString());
    });
  }
}
