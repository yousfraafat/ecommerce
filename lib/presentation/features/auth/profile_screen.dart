import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/home_title.png'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome,user',
                style: TextStyle(
                  color: MyApp.mainColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              MyTextField(
                editable: false,
                hint: 'enter your user name',
                title: 'User Name',
                inputType: TextInputType.name,
                titleColor: MyApp.mainColor,
                borderSide: BorderSide(color: MyApp.mainColor.withOpacity(.3)),
              ),
              MyTextField(
                editable: false,
                hint: 'enter your email',
                title: 'E-mail',
                inputType: TextInputType.emailAddress,
                titleColor: MyApp.mainColor,
                borderSide: BorderSide(color: MyApp.mainColor.withOpacity(.3)),
              ),
              MyTextField(
                editable: false,
                hint: 'enter your password',
                title: 'Password',
                securedPassword: true,
                inputType: TextInputType.visiblePassword,
                titleColor: MyApp.mainColor,
                borderSide: BorderSide(
                  color: MyApp.mainColor.withOpacity(.3),
                  width: 2,
                ),
              ),
              MyTextField(
                editable: false,
                hint: 'enter your address',
                title: 'Address',
                inputType: TextInputType.streetAddress,
                titleColor: MyApp.mainColor,
                borderSide: BorderSide(color: MyApp.mainColor.withOpacity(.3)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
