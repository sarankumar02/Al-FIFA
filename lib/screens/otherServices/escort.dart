import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/other_services.dart';
import 'package:al_fifa/screens/otherServices/other_services.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:flutter/material.dart';

class Escort extends StatelessWidget {
  final OtherServicesBloc otherServicesBloc;
  const Escort({super.key, required this.otherServicesBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream: otherServicesBloc.applicantNameEscort,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "Applicant name",
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeApplicantNameEscort,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.mobileNumber,
            builder: (context, valueMOFA) {
              return CustomTextField(
                keyboardTypeNumber: true,
                name: "Mobile number",
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeMobileNumber,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.email,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "Email Id",
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeEmail,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Image.asset(
            "assets/Icons/info purple.png",
            width: 25,
            height: 25,
          ),
          title: Text(
            "Cost will be determined after reviewing the documents.",
            style: TextStyleAlFifa.mediumText,
          ),
        ),
        StreamBuilder<bool>(
            stream: otherServicesBloc.escortValid,
            builder: (context, valueESCOT) {
              print(valueESCOT.hasData);
              return CustomElevatedButton(
                  onTap: !valueESCOT.hasData
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text(AppConstants.pleaseFillAllFields)));
                        }
                      : () {
                          otherServicesBloc.escortSubmit(context: context);
                        },
                  text: "Submit");
            }),
      ],
    );
  }
}
