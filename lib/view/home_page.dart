import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'WELCOME ABOARD',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          ElevatedButton(
            onPressed: () {
              userPreference.remove().then((value) => {
                    Navigator.pushReplacementNamed(context, MyRoutes.loginRoute)
                  });
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red),
            ),
            child: const Text(
              'LOG OUT',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
