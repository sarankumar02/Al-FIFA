import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({super.key});

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomAppBar(context, "Contact Us"),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                const CustomTextField(name: "Your Name (Required)"),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(name: "Your email (Required)"),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(name: "Subject"),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    maxLines: 8,
                    toolbarOptions: const ToolbarOptions(
                      paste: false,
                    ),

                    // widget.name,
                    textAlign: TextAlign.start,

                    style: customBRCobaneTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 30.0, top: 23, bottom: 23),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              width: 3.0, color: AppColor.secondaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              width: 2.0, color: AppColor.secondaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              width: 3.0, color: AppColor.secondaryColor)),
                      hintText: "Your Message",
                      hintStyle: TextStyleAlFifa.normalText,
                      // errorText: widget.errorText,
                    ),

                    // decoration: InputDecoration(
                    //     errorBorder: InputBorder.none,
                    //     enabledBorder: InputBorder.none,
                    //     focusedBorder: InputBorder.none,
                    //     disabledBorder: InputBorder.none,
                    //     focusedErrorBorder: InputBorder.none,
                    //     border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10)),

                    //      errorText: widget.errorText,
                    //     hintStyle: customBRCobaneTextStyle(
                    //         fontSize: 12,
                    //         lineHeight: 1.5,
                    //         fontWeight: FontWeight.w300,
                    //         color: AppColors.textBoxHintColor),
                    //     hintText: widget.name),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(name: "Subject"),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButton(
                    onTap: () {
                      // Navigator.pushNamed(context, travelInformation);
                      Navigator.pop(context);
                    },
                    text: "Send"),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      )),
    ));
  }
}
