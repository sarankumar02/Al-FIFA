import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class VisaScreenOne extends StatefulWidget {
  const VisaScreenOne({Key? key}) : super(key: key);

  @override
  State<VisaScreenOne> createState() => _VisaScreenOneState();
}

class _VisaScreenOneState extends State<VisaScreenOne> {
  TextEditingController? controller;


  BuildContext? con;




  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 20,),
              CustomAppBar(context, "Visa"),

              GlobeImage(),

              customTextFieldIconsRight(controller, "earth.png", "Select Country"),

              CustomElevatedButton( text: "Continue",
                  onTap: (){
                    Navigator.pushNamed(context, visaScreenTwo);
                  }),
                  SizedBox(height: 30,)
            ],
          ),
        ),
      ),

    );
  }


  Widget GlobeImage(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset("assets/illustrations/world.png"),
      ),
    );
  }



}
