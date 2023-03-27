import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';


Widget CustomAppBar(BuildContext context, String title) {
 return Container(
   padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
   child: Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
        GestureDetector(
         onTap: () {
           Navigator.pop(context);
         },
         child: Image.asset("assets/Icons/back.png", width: 30, height: 30,),
       ),
       Text(title, style: TextStyleAlFifa.titleLabel,),
       const Text("arabic", style: TextStyleAlFifa.text)
     ],


   ),
 );
}



Widget customTextField2(TextEditingController? controller, String hintText,String? errorText,Function(String) onChanged) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(left: 12.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
            const BorderSide(width: 3.0, color: AppColor.secondaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
            const BorderSide(width: 2.0, color: AppColor.secondaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
            const BorderSide(width: 3.0, color: AppColor.secondaryColor)),

        hintText: hintText,
        errorText: errorText,
        ),
        onChanged: onChanged,
  );
}

Widget customTextField(TextEditingController? controller, String hintText,String? errorText,Function(String) onChanged,bool obscureText) {
  return TextField(
    obscureText:obscureText ,
    // controller: controller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(left: 12.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
            const BorderSide(width: 3.0, color: AppColor.secondaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
            const BorderSide(width: 2.0, color: AppColor.secondaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
            const BorderSide(width: 3.0, color: AppColor.secondaryColor)),

        hintText: hintText,  hintStyle: TextStyleAlFifa.normalText,
        errorText: errorText,
        ),
        onChanged: onChanged,
  );
}

Widget customTextFieldIconsRight(TextEditingController? controller, String icon, String hintText) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
              const BorderSide(width: 5.0, color: AppColor.secondaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
              const BorderSide(width: 2.0, color: AppColor.secondaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
              const BorderSide(width: 3.0, color: AppColor.secondaryColor)),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/Icons/$icon", width: 20,height: 20,
            ),
          ),
          hintText: hintText),
    ),
  );
}

