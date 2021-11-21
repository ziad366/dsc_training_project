import 'package:dsc_training_project/widgets/sign_up_form.dart';
import 'package:dsc_training_project/widgets/socail_card.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static String id = 'SignUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 248, 253, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Register Account",
              style: TextStyle(
                color: Color.fromRGBO(241, 107, 39, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            SignUpForm(),
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
