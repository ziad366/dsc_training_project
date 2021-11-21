import 'package:dsc_training_project/widgets/sign_in_form.dart';
import 'package:dsc_training_project/widgets/socail_card.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';

class SignIn extends StatelessWidget {
  static String id = 'SignIn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 248, 253, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Welcome back",
              style: TextStyle(
                color: Color.fromRGBO(241, 107, 39, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Please Sign in to continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20,
              ),
            ),
            SizedBox(height: 12),
            SignForm(),
            SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account? ",
              style: TextStyle(fontSize: 14),
            ),
            GestureDetector(
             onTap: ()=> Navigator.pushNamed(context, SignUp.id),
              child: Text(
                "Register",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(241, 107, 39, 1)),
              ),
            ),
          ],
        ),
            SizedBox(height: 12),
            Text(
              "Quick access with :",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocalCard(
                  icon: "assets/icons/google-icon.svg",
                  press: () {},
                ),
                SocalCard(
                  icon: "assets/icons/facebook-2.svg",
                  press: () {},
                ),
                SocalCard(
                  icon: "assets/icons/twitter.svg",
                  press: () {},
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
