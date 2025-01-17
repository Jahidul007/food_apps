import 'package:flutter/material.dart';
import 'package:food_app/helper/screen_navigation.dart';
import 'package:food_app/helper/style.dart';
import 'package:food_app/providers/auth.dart';
import 'package:food_app/screens/login.dart';
import 'package:food_app/widgets/custom_text.dart';
import 'package:food_app/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("images/avatar.png", width: 240, height: 240),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: authProvider.name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username",
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: authProvider.email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Emails",
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: authProvider.password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          icon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (!await authProvider.signUp()) {
                        _key.currentState.showSnackBar(
                            SnackBar(content: Text('Registration Failed!'))
                        );
                        return;
                      }
                      authProvider.cleanControllers();
                      changeScreenReplacement(context, Home());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: red,
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomText(
                              text: "Register",
                              colors: white,
                              size: 22,
                              weight: FontWeight.bold,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    changeScreen(context, LoginScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(
                        text: "Login here",
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            )),
    );
  }
}
