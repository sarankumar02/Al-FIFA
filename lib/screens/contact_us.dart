import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/settings_bloc.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({super.key});

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  late SettingsBloc settingsBloc;
  @override
  Widget build(BuildContext context) {
    settingsBloc = Provider.of<SettingsBloc>(context);
    return SafeArea(
        child: Scaffold(
      body:  LoaderOverlay(
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
                  StreamBuilder(
                      stream: settingsBloc.name,
                      builder: (context, snapshot) {
                        return CustomTextField(
                          name: "Your Name (Required)",
                          errorText: (snapshot.error.toString() == 'null')
                              ? null
                              : snapshot.error.toString(),
                          onchanged: settingsBloc.changeName,
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                      stream: settingsBloc.email,
                      builder: (context, snapshot) {
                        return CustomTextField(
                          name: "Your email (Required)",
                          errorText: (snapshot.error.toString() == 'null')
                              ? null
                              : snapshot.error.toString(),
                          onchanged: settingsBloc.changeEmail,
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                      stream: settingsBloc.subject,
                      builder: (context, snapshot) {
                        return CustomTextField(
                          name: "Subject",
                          errorText: (snapshot.error.toString() == 'null')
                              ? null
                              : snapshot.error.toString(),
                          onchanged: settingsBloc.changeSubject,
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                      stream: settingsBloc.message,
                      builder: (context, snapshot) {
                        return Container(
                          child: TextFormField(
                            maxLines: 8,
      
                            onChanged: settingsBloc.changeMessage,
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
                                      width: 3.0,
                                      color: AppColor.secondaryColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      width: 2.0,
                                      color: AppColor.secondaryColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      width: 3.0,
                                      color: AppColor.secondaryColor)),
                              hintText: "Your Message",
                              hintStyle: TextStyleAlFifa.normalText,
                              errorText: (snapshot.error.toString() == 'null')
                                  ? null
                                  : snapshot.error.toString(),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  StreamBuilder<bool>(
                      stream: settingsBloc.contectUsValid,
                      builder: (context, snapshot) {
                        return CustomElevatedButton(
                            onTap: !snapshot.hasData
                                ? () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(AppConstants
                                                .pleaseFillAllFields)));
                                  }
                                : () {
                                    settingsBloc.contactUsSubmit(
                                        context: context);
                                  },
                            text: "Send");
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    ));
  }
}
