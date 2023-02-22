import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomAppBar(context, "My Profile"),
            Container(
              child: Image.asset(
                "assets/Logos/Alfifa logo.png",
                width: 120,
                height: 120,
              ),
            ),
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
          customTextField(controller, "subash"),
          SizedBox(height: 20,),
          customTextField(controller, "India"),
          SizedBox(height: 20,),
          customTextField(controller, "+91 7667170199"),
          SizedBox(height: 20,),
          customTextField(controller, "sethu@gmail.com"),
          SizedBox(height: 20,),
          customTextField(controller, "*****"),
          SizedBox(height: 20,),
          customTextField(controller, "*****"),
          SizedBox(height: 40,),
          CustomElevatedButton(onTap: (){}, text: "Save"),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
