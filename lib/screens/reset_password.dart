import 'package:al_fifa/bloc/forgot_bloc.dart';
import 'package:al_fifa/bloc/login_bloc.dart';
import 'package:al_fifa/bloc/reset_bloc.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController? emailMobileNoCntrlr;
  late ResetPassswordBloc resetPassswordBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resetPassswordBloc = ResetPassswordBloc();
  }

  @override
  Widget build(BuildContext context) {
    // loginBloc = Provider.of<LoginBloc>(context);
    return Scaffold(
      body: LoaderOverlay(
        useDefaultLoading: false,
        disableBackButton: false,
        overlayWidget: const Center(
          child: SpinKitCubeGrid(
            color: AppColor.primaryColor,
            size: 50.0,
          ),
        ),
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        child: Container(
            padding: const EdgeInsets.only(top: 10, left: 8.0, right: 8.0),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  logoWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  loginText(),
                  emailPhoneWidget(),
                  emailPasswordWidget(),
                  emailConfirmPasswordWidget(),
                  // passWordWidget(),
                  // forgotPassWordText(),
                  loginButton(),
                  // dontHaveAccText(),
                  // socialLogin()
                ],
              ),
            )),
      ),
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
      "Reset password",
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
      child: StreamBuilder(
          stream: resetPassswordBloc.email,
          builder: (context, snapshot) {
            return TextField(
              // controller: emailMobileNoCntrlr,
              onChanged: resetPassswordBloc.changeEmail,
              decoration: InputDecoration(
                  errorText: (snapshot.error.toString() == 'null')
                      ? null
                      : snapshot.error.toString(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 5.0, color: AppColor.secondaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 2.0, color: AppColor.secondaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 3.0, color: AppColor.secondaryColor)),
                  suffixIcon: const Icon(
                    Icons.person,
                    color: AppColor.secondaryColor,
                  ),
                  hintText: "Email ID / Mobile no",  hintStyle: TextStyleAlFifa.normalText),
            );
          }),
    );
  }

  Widget emailPasswordWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      child: StreamBuilder(
          stream: resetPassswordBloc.password,
          builder: (context, snapshot) {
            return TextField(
              obscureText: true,
              // controller: emailMobileNoCntrlr,
              onChanged: resetPassswordBloc.changePassword,
              decoration: InputDecoration(
                  errorText: (snapshot.error.toString() == 'null')
                      ? null
                      : snapshot.error.toString(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 5.0, color: AppColor.secondaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 2.0, color: AppColor.secondaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 3.0, color: AppColor.secondaryColor)),
                  suffixIcon: const Icon(
                    Icons.lock,
                    color: AppColor.secondaryColor,
                  ),
                  hintText: "Enter Password",  hintStyle: TextStyleAlFifa.normalText),
            );
          }),
    );
  }

  Widget emailConfirmPasswordWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      child: StreamBuilder(
          stream: resetPassswordBloc.confirmPassword,
          builder: (context, snapshot) {
            return TextField(
              obscureText: true,
              // controller: emailMobileNoCntrlr,
              onChanged: resetPassswordBloc.changeConfirmPassword,
              decoration: InputDecoration(
                  errorText: (snapshot.error.toString() == 'null')
                      ? null
                      : snapshot.error.toString(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 5.0, color: AppColor.secondaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 2.0, color: AppColor.secondaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          width: 3.0, color: AppColor.secondaryColor)),
                  suffixIcon: const Icon(
                    Icons.lock,
                    color: AppColor.secondaryColor,
                  ),
                  hintText: "Enter Confirm Password",  hintStyle: TextStyleAlFifa.normalText),
            );
          }),
    );
  }

  // vi - Login button
  Widget loginButton() {
    return StreamBuilder<bool>(
        stream: resetPassswordBloc.resetPasswordValid,
        builder: (context, snapshot) {
          return Container(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            width: double.infinity,
            child: ElevatedButton(
              child: const Text("Submit"),
              onPressed:
                  // print("Running");
                  !snapshot.hasData
                      ? () {
                          print("not vaild");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text(AppConstants.pleaseFillAllFields)));
                        }
                      : () {
                          print(" vaild");
                          resetPassswordBloc.resetpassword(context: context);
                        },

              // Navigator.pushReplacementNamed(context, "/homePage");

              style: ElevatedButton.styleFrom(
                  primary: AppColor.secondaryColor,
                  onPrimary: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 5,
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
          );
        });
  }

  // vii - Register
  Widget dontHaveAccText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't Have an account?"),
          TextButton(
            child: const Text("Register",
                style: TextStyle(
                  color: AppColor.secondaryColor,
                )),
            onPressed: () {
              Navigator.pushNamed(context, registerScreen);
            },
          ),
        ],
      ),
    );
  }

  // viii - social login
  Widget socialLogin() {
    return Container(
      child: Column(children: [
        const Text(
          "Or login with",
          style: TextStyle(color: AppColor.primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                "assets/Icons/facebook.png",
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                "assets/Icons/google plus.png",
                width: 50,
                height: 50,
              ),
            )
          ],
        )
      ]),
    );
  }
}
