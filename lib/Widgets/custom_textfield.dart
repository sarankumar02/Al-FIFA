import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/settings_bloc.dart';

class CustomTextField extends StatefulWidget {

  final String name;
  final String? errorText;
  final TextEditingController? controller;
  final Function(String)? onchanged;
  final Function()? togglePasswordView;
  final InkWell? suffix;
  final bool textpaste;

  final bool readOnly;
  final bool isHidden;
  final bool obscureText;

  const CustomTextField(
      {Key? key,
    
      required this.name,
      this.onchanged,
      this.errorText,
      this.controller,
      this.togglePasswordView,
      this.readOnly = false,
      this.obscureText = false,
      this.isHidden = false,
      this.textpaste = true,
      this.suffix})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late SettingsBloc settingsBloc;

  @override
  Widget build(BuildContext context) {
    settingsBloc = Provider.of<SettingsBloc>(context);
    return StreamBuilder(
        stream: settingsBloc.appTheme,
        builder: (context, AsyncSnapshot<ThemeData> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                toolbarOptions: ToolbarOptions(
                  paste: widget.textpaste,
                ),
                controller: widget.controller,
                onChanged: widget.onchanged,
                obscureText: widget.obscureText,
                // widget.name,
                textAlign: TextAlign.start,
                readOnly: widget.readOnly,
                style: customBRCobaneTextStyle(
                  fontSize: 16,
                  
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 30.0,top: 23,bottom: 23),
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
                  hintText: widget.name,
                    hintStyle: TextStyleAlFifa.normalText,
                  errorText: widget.errorText,
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
            ],
          );
        });

    // return StreamBuilder(
    //     stream: settingsBloc.appTheme,
    //     builder: (context, AsyncSnapshot<ThemeData> snapshot) {
    //       return Container(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 10,
    //         ),
    //         child: Stack(
    //           children: [
    //             Container(
    //               height: 50,
    //               margin: EdgeInsets.only(top: 14),
    //               child: TextFormField(
    //                 // widget.name,
    //                 textAlign: TextAlign.start,
    //                 style: customBRCobaneTextStyle(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w400,
    //                     color: snapshot.data != null &&
    //                             snapshot.data == AppConstants.lightTheme
    //                         ? AppColors.blackColor
    //                         : AppColors.whiteColor),
    //                 decoration: InputDecoration(
    //                     errorBorder: InputBorder.none,
    //                     enabledBorder: InputBorder.none,
    //                     focusedBorder: InputBorder.none,
    //                     disabledBorder: InputBorder.none,
    //                     focusedErrorBorder: InputBorder.none,
    //                     border: InputBorder.none,
    //                     hintText: widget.name),
    //               ),
    //             ),
    //             Positioned(
    //               top: 10,
    //               child:
    //                Container(
    //                 child: Text(
    //                   widget.label,
    //                   textAlign: TextAlign.center,
    //                   style: customBRCobaneTextStyle(
    //                       fontSize: 10,
    //                       fontWeight: FontWeight.w400,
    //                       color: snapshot.data != null &&
    //                               snapshot.data == AppConstants.lightTheme
    //                           ? AppColors.dropdownLabel
    //                           : AppColors.whiteColor),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //               color: snapshot.data != null &&
    //                       snapshot.data == AppConstants.lightTheme
    //                   ? AppColors.boxBorder
    //                   : AppColors.darkThemeBoxBorder,
    //               width: 1.0),
    //           borderRadius: BorderRadius.circular(7.0),
    //         ),
    //       );
    //     });
  }
}
