import 'package:flutter/material.dart';
import 'package:mvvm_app/res/components/rounded_button.dart';
import 'package:mvvm_app/utils/routes.dart';
import 'package:mvvm_app/utils/utils.dart';
import 'package:mvvm_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obscurePassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authViewModel = Provider.of<AuthviewProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  onFieldSubmitted: (value) {
                    Utils.changeFocusNode(
                        context, emailFocusNode, passwordFocusNode);
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword.value,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        label: const Text('Password'),
                        prefixIcon: const Icon(Icons.lock_open_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _obscurePassword.value = !_obscurePassword.value;
                          },
                          icon: (_obscurePassword.value)
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height * .1,
                ),
                RoundedButton(
                  title: 'Login',
                  loading: authViewModel.loading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarError('Please Enter Email', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarError('Please Enter Password', context);
                    } else if (_passwordController.text.length < 4) {
                      Utils.toastMsg('Password Length less than 8');
                    } else {
                      Map data = {
                        'email': _emailController.text,
                        'password': _passwordController.text
                      };
                      authViewModel.loginApi(data, context);

                      debugPrint('HIIT');
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                const Text('Don\'t have an account?'),
                RoundedButton(
                  title: 'Sign Up',
                  onPress: () {
                    Navigator.pushReplacementNamed(
                        context, MyRoutes.signUpRoute);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
