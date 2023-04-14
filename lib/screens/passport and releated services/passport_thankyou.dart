import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PassportThankyou extends StatefulWidget {
  final String? title;
  final String? message;
  const PassportThankyou({super.key,  this.title,  this.message});

  @override
  State<PassportThankyou> createState() => _PassportThankyouState();
}

class _PassportThankyouState extends State<PassportThankyou> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(context, widget.title!),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 70),
              child: Column(
                
                children: [
                  Image.asset(
                    "assets/Icons/check.png",
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Thank you",
                    style: TextStyleAlFifa.titleLabel,
                  ),
                     const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.message!,
                    // "Your request has been successfully submitted. We will contact you soon.",
                    style: customBRCobaneTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),
                  )
                ],
              ),
            ),
            SizedBox(height: 90,),
            CustomElevatedButton(
                    onTap: () {
                      // Navigator.pushNamed(context, travelInformation);
                      Navigator.pop(context);
                    }, text: "Return to Home")
          ],
        )),
      ),
    );
  }
}
