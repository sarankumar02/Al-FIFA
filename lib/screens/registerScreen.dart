import 'package:al_fifa/bloc/auth_bloc.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controller = TextEditingController();
  bool acceptCondn = false;
  late AuthBloc authBloc;
  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 200),
        () => {
              authBloc.changeRegisterDeclarationAccepted(false),
            });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authBloc = Provider.of<AuthBloc>(context);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                child: Image.asset(
                  "assets/Logos/Alfifa logo.png",
                  width: 120,
                  height: 120,
                ),
              ),
              const Text(
                "Register",
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              MyProfileTextField()
            ],
          ),
        ),
      ),
    );
  }

  Widget MyProfileTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
      child: Column(
        children: [
          StreamBuilder(
              stream: authBloc.firstName,
              builder: (context, snapshot) {
                return customTextField(
                    controller,
                    "First Name",
                    (snapshot.error.toString() == 'null')
                        ? null
                        : snapshot.error.toString(),
                    authBloc.changeFirstName,
                    false);
              }),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: authBloc.lastName,
              builder: (context, snapshot) {
                return customTextField(
                    controller,
                    "Last Name",
                    (snapshot.error.toString() == 'null')
                        ? null
                        : snapshot.error.toString(),
                    authBloc.changeLastName,
                    false);
              }),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: authBloc.contactNumber,
              builder: (context, snapshot) {
                return customTextField(
                    controller,
                    "Phone Number",
                    (snapshot.error.toString() == 'null')
                        ? null
                        : snapshot.error.toString(),
                    authBloc.changeContactNumber,
                    false);
              }),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: authBloc.email,
              builder: (context, snapshot) {
                return customTextField(
                    controller,
                    "Email Id",
                    (snapshot.error.toString() == 'null')
                        ? null
                        : snapshot.error.toString(),
                    authBloc.changeEmail,
                    false);
              }),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: authBloc.password,
              builder: (context, snapshot) {
                return customTextField(
                    controller,
                    "Password",
                    (snapshot.error.toString() == 'null')
                        ? null
                        : snapshot.error.toString(),
                    authBloc.changePassword,
                    true);
              }),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: authBloc.password,
              builder: (context, snapshot1) {
                return StreamBuilder(
                    stream: authBloc.confirmPassword,
                    builder: (context, snapshot2) {
                      return customTextField(
                          controller,
                          "Confirm Password",
                          (snapshot2.error.toString() != 'null')
                              ? snapshot2.error.toString()
                              : snapshot1.data != snapshot2.data
                                  ? "Password and confirm password should be same"
                                  : null,
                          authBloc.changeConfirmPassword,
                          true);
                    });
              }),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [checkBoxOne("PayPal.svg.png")],
          ),
         StreamBuilder(
          stream: authBloc.registerDeclarationAccepted,
          builder: (context, AsyncSnapshot snapshot) {
              return StreamBuilder<bool>(
                  stream: authBloc.registerValid,
                  builder: (context, snapshot1) {
                    return CustomElevatedButton(
                        onTap:snapshot.data==true? !snapshot1.hasData
                            ? () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(AppConstants.pleaseFillAllFields),
                                  ),
                                );
                              }
                            : () => {
                                  authBloc.registerUser(
                                    context: context,
                                  ),
                                }:() {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(AppConstants.pleaseFillAllFields),
                                  ),
                                );
                              },
                        text: "Register");
                  });
            }
          ),
          dontHaveAccText(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  // vii - Register
  Widget dontHaveAccText() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?"),
          TextButton(
            child: const Text("Login",
                style: TextStyle(
                  color: AppColor.secondaryColor,
                )),
            onPressed: () {
              Navigator.pushNamed(context, loginScreen);
            },
          ),
        ],
      ),
    );
  }

  Widget checkBoxOne(String image) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: StreamBuilder(
          stream: authBloc.registerDeclarationAccepted,
          builder: (context, AsyncSnapshot snapshot) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                        shape: const CircleBorder(),
                        value: snapshot.data,
                        onChanged: authBloc.changeRegisterDeclarationAccepted),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Text("Accept all terms & conditions"))
                ]);
          }),
    );
  }
}
