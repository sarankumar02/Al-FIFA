import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? emailMobileNoCntrlr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 10, left: 8.0, right: 8.0),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                logoWidget(),
                SizedBox(
                  height: 20,
                ),
                loginText(),
                emailPhoneWidget(),
                passWordWidget(),
                forgotPassWordText(),
                loginButton(),
                dontHaveAccText(),
                 socialLogin()
              ],
            ),
          )),
    );
  }

  // i - Logo
  Widget logoWidget() {
    return Image.asset(
      "assets/Logos/Alfifa logo.png",
      width: 250,
      height: 250,
    );
  }

  // ii - Login Text
  Widget loginText() {
    return const Text(
      "Login",
      style: TextStyle(
          color: AppColor.primaryColor,
          fontSize: FontConstant.headingText,
          fontWeight: FontWeight.bold),
    );
  }

// iii Email or Phone Text Input
  Widget emailPhoneWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      child: TextField(
        controller: emailMobileNoCntrlr,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(width: 5.0, color: AppColor.secondaryColor)),
            suffixIcon: Icon(
              Icons.person,
              color: AppColor.secondaryColor,
            ),
            hintText: "Email ID / Mobile no"),
      ),
    );
  }


  // iv - Password input field
  Widget passWordWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 10, left: 30, right: 30),
      child: TextField(
        controller: emailMobileNoCntrlr,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(width: 5.0, color: AppColor.secondaryColor)),
            suffixIcon: Icon(
              Icons.lock,
              color: AppColor.secondaryColor,
            ),
            hintText: "Password"),
      ),
    );
  }


  // v - forgot password text
  Widget forgotPassWordText() {
    return Container(
      padding: EdgeInsets.only(right: 30),
      alignment: Alignment.centerRight,
      child: Text(
        "Forgot Password?",
      ),
    );
  }


  // vi - Login button
  Widget loginButton() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 30, right: 30),
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Login"),
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/homePage");
        },
        style: ElevatedButton.styleFrom(
            primary: AppColor.secondaryColor,
            onPrimary: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
            padding: EdgeInsets.only(
                left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)))),
      ),
    );
  }


  // vii - Register
  Widget dontHaveAccText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't Have an account?"),
          TextButton(
           child : Text("Register",
            style: TextStyle(
              color: AppColor.secondaryColor,
            )),
            onPressed: (){},
          ),
        ],
      ),
    );
  }

  // viii - social login
  Widget socialLogin(){
    return Container(
      child: Column(
          children :[
        Text("Or login with",
        style: TextStyle(
          color: AppColor.primaryColor),
        ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Image.asset("assets/Icons/facebook.png", width: 50,height: 50,),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){},
                  child: Image.asset("assets/Icons/google plus.png", width: 50,height: 50,),
                )


              ],
            )
      ]),
    );
  }




}
