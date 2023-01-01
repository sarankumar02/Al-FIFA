
import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({required this.onTap, required this.text });
 final String text;
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 10, left: 30, right: 30),
      width: double.infinity,
      child: ElevatedButton(
        child: Text(text, style: TextStyle(
            fontWeight: FontWeight.bold
        ),),
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
            primary: AppColor.secondaryColor,
            onPrimary: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
            padding: EdgeInsets.only(
                left: 30.0, right: 30.0, top: 18.0, bottom: 18.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)))),
      ),
    );
  }
}
