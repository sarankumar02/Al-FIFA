import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controller = TextEditingController();
  bool acceptCondn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),

            Container(
              child: Image.asset(
                "assets/Logos/Alfifa logo.png",
                width: 120,
                height: 120,
              ),

            ),
            Text("Register",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
            MyProfileTextField()

          ],
        ),
      ),
    );
  }

  Widget MyProfileTextField(){
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30,top: 20),
      child: Column(

        children: [
          customTextField(controller, "First Name"),
          SizedBox(height: 20,),
          customTextField(controller, "Last Name"),
          SizedBox(height: 20,),
          customTextField(controller, "Phone Number"),
          SizedBox(height: 20,),
          customTextField(controller, "Email Id"),
          SizedBox(height: 20,),
          customTextField(controller, "Password"),
          SizedBox(height: 20,),
          customTextField(controller, "Confirm Password"),
          SizedBox(height: 20,),
          Row(
            children: [
              checkBoxOne("PayPal.svg.png")
            ],
          ),
          CustomElevatedButton(onTap: (){}, text: "Register"),
          dontHaveAccText(),
          SizedBox(height: 40,),
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
          Text("Already have an account?"),
          TextButton(
            child : Text("Login",
                style: TextStyle(
                  color: AppColor.secondaryColor,
                )),
            onPressed: (){
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
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            shape: CircleBorder(),
            value: this.acceptCondn,
            onChanged: (bool? value) {
              setState(() {
                this.acceptCondn = value!;
              });
            },
          ),
        ),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only( right: 20),
            child: Text("Accept all terms & conditions"))
      ]),
    );
  }

}
