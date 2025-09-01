import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/widgets/my_text_field.dart';
import 'package:ecommerce/presentation/features/auth/register_screen.dart';
import 'package:ecommerce/presentation/features/main_layout/main_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyApp.mainColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Center(
                    child: Image.asset('assets/images/route_logo.png'),
                  ),
                ),
                SizedBox(height: 50),
                MyTextField(
                  hint: 'enter your email address',
                  title: 'Email address',
                  inputType: TextInputType.name,
                  controller: email,
                  validator: (text) {
                    if (text?.isEmpty == true) {
                      return 'please enter your email';
                    }
                    if (EmailValidator.validate(text!) == false) {
                      return 'wrong email';
                    }
                    return null;
                  },
                ),
                MyTextField(
                  hint: 'enter your password',
                  title: 'password',
                  inputType: TextInputType.visiblePassword,
                  securedPassword: true,
                  controller: password,
                  validator: (text) {
                    if (text?.isEmpty == true) {
                      return 'please enter password';
                    }
                    if (text!.length < 6) {
                      return 'password at least 6 characters';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              MainScreen.routeName,
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20),
                          ),
                          child: Text(
                            'login',
                            style: TextStyle(
                              color: MyApp.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: Colors.grey),
                      onPressed:
                          () => Navigator.pushReplacementNamed(
                            context,
                            RegisterScreen.routeName,
                          ),
                      child: Text('sign up!!', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
