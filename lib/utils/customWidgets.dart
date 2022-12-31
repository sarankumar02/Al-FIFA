import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';


Widget CustomAppBar(BuildContext context, String title) {
 return Container(
   padding: EdgeInsets.only(top: 20, left: 12, right: 12),
   child: Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
        GestureDetector(
         onTap: () {
           Navigator.pop(context);
         },
         child: Image.asset("assets/Icons/back.png", width: 30, height: 30,),
       ),
       Text(title, style: TextStyleAlFifa.text,),
       Text("arabic", style: TextStyleAlFifa.text)
     ],


   ),
 );
}



Widget customTextField(TextEditingController? controller, String hintText) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
            BorderSide(width: 5.0, color: AppColor.secondaryColor)),
        hintText: hintText),
  );
}

Widget customTextFieldIconsRight(TextEditingController? controller, String icon, String hintText) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
              BorderSide(width: 5.0, color: AppColor.secondaryColor)),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/Icons/$icon", width: 20,height: 20,
            ),
          ),
          hintText: hintText),
    ),
  );
}

