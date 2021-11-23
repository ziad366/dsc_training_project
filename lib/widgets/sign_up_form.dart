import 'package:dsc_training_project/screens/HomePage.dart';
import 'package:flutter/material.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  dynamic email;
  dynamic password;
  dynamic confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Email :",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            buildEmailFormField(),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Password :",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            buildPasswordFormField(),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Confirm Password :",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            buildConfirmPasswordFormField(),
            SizedBox(height: 10),
            SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 60,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(241, 107, 39, 1),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                      Navigator.pushNamed(context, HomePage.id);
                  }
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value){
        password =value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your password";
        } else if (value.length < 8) {
          return "Password is too short";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "enter password",
        hintStyle: TextStyle(fontSize: 14.0,color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/images/visibility.png",
            height: 15,
            color: Color.fromRGBO(241, 107, 39, 1)
          ),
        ),
      ),
    );
  }
  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value){
        confirmPassword=value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your password";
        } else if (password != value) {
          return "Passwords don't match";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "return password" ,
        hintStyle: TextStyle(fontSize: 14.0,color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/images/visibility.png",
            height: 15,
            color: Color.fromRGBO(241, 107, 39, 1)
          ),
        ),
      ),
    );
  }


  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value){
        email=value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your email";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return "Please Enter Valid Email";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "enter  email",
        hintStyle: TextStyle(fontSize: 14.0,color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white),
          gapPadding: 10,
        ),
      ),
    );
  }


  final RegExp emailValidatorRegExp =
  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
