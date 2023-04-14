import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/other_services.dart';
import 'package:al_fifa/screens/otherServices/other_services.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:flutter/material.dart';

class InternationalDriving extends StatelessWidget {
  final OtherServicesBloc otherServicesBloc;
  const InternationalDriving({super.key, required this.otherServicesBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            // margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.secondaryColor, width: 2.5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: StreamBuilder(
                stream: otherServicesBloc.quantity,
                builder: (context, AsyncSnapshot snapshot1) {
                  return DropdownButtonFormField<Map<String, dynamic>>(
                    value: snapshot1.data,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none),
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        "assets/Icons/drop down.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    items: AppConstants.quantity.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "${items["type"]}",
                              style: customBRCobaneTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackColor),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: const Padding(
                      padding: EdgeInsets.only(left: 18.0, top: 8.0),
                      child: Text(
                        "IDL Quantity",
                        textAlign: TextAlign.center,
                        style: TextStyleAlFifa.normalText,
                      ),
                    ),
                    onChanged: (value) {
                      otherServicesBloc.changequantity(value);
                    },
                  );
                })),
        const SizedBox(
          height: 20,
        ),
        Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            // margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.secondaryColor, width: 2.5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: StreamBuilder(
                stream: otherServicesBloc.services,
                builder: (context, AsyncSnapshot snapshot1) {
                  return DropdownButtonFormField<Map<String, dynamic>>(
                    value: snapshot1.data,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none),
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        "assets/Icons/drop down.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    items: AppConstants.services.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "${items["type"]}",
                              style: customBRCobaneTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackColor),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: const Padding(
                      padding: EdgeInsets.only(left: 18.0, top: 8.0),
                      child: Text(
                        "Services",
                        textAlign: TextAlign.center,
                        style: TextStyleAlFifa.normalText,
                      ),
                    ),
                    onChanged: (value) {
                      otherServicesBloc.changeservices(value);
                    },
                  );
                })),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.lincenseCollectionChoice,
            builder: (context, snapshot) {
              return CustomTextField(
                name: "Lincense collection choice",
                errorText: (snapshot.error.toString() == 'null')
                    ? null
                    : snapshot.error.toString(),
                onchanged: otherServicesBloc.changeLincenseCollectionChoice,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.applicantName,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "Applicant name",
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeApplicantName,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.mobileNumber,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "Mobile number",
                  keyboardTypeNumber: true,
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
            "Service Cost 119 SAR Cost Includes: Service fees, Appointment Booking & Form Filling, DOES NOT include Embassy Fees. (Passport renewal usually takes 15 to 35 days in Embassy)",
            style: TextStyleAlFifa.mediumText,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder<bool>(
            stream: otherServicesBloc.iDLValid,
            builder: (context, snapshot) {
              print(snapshot.hasData);
              return CustomElevatedButton(
                  onTap: !snapshot.hasData
                      ? () {
                          // otherServicesBloc.passPortSubmit(context: context);
                          // print("not vaild");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text(AppConstants.pleaseFillAllFields)));
                        }
                      : () {
                          otherServicesBloc.passPortSubmit(context: context);
                        },
                  text: "Submit");
            }),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
