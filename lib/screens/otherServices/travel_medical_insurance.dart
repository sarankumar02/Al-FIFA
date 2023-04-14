import 'package:al_fifa/Widgets/custom_date_picker.dart';
import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/other_services.dart';
import 'package:al_fifa/screens/otherServices/other_services.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:search_choices/search_choices.dart';

class TravelMedicalInsurance extends StatelessWidget {
  final OtherServicesBloc otherServicesBloc;
  TravelMedicalInsurance({super.key, required this.otherServicesBloc});
  TextEditingController dobController = TextEditingController();

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
                stream: otherServicesBloc.selectedNationality,
                builder: (context, AsyncSnapshot snapshot1) {
                  return SearchChoices.single(
                    padding: const EdgeInsets.only(top: 05, left: 10),
                    underline: const SizedBox(),
                    displayClearIcon: false,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        "assets/Icons/drop down.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    searchInputDecoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 15)),
                    items: AppConstants.listOfCountriesWithCode.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items["country"].toString().split("(")[0],
                          style: const TextStyle(
                              fontSize: 17, fontFamily: 'Tajawal-Regular'),
                        ),
                      );
                    }).toList(),
                    hint: "Select nationality",
                    searchHint: "Select one",
                    value: snapshot1.data,
                    onChanged: (value) {
                      otherServicesBloc.changeSelectedNationality(value);
                    },
                    isExpanded: true,
                  );
                })),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.livingPlace,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "Where you will be living",
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeLivingPlace,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.selectedDate,
            builder: (context, snapshot) {
              return CustomDatePicker(
                name: "Date of birth",
                onChange: (value) {
                  otherServicesBloc.changeSelectedDate(value);
                },
                errorText: (snapshot.error.toString() == 'null')
                    ? null
                    : snapshot.error.toString(),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          1900), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime.now());

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat(AppConstants.YYYMMDDFormat)
                            .format(pickedDate);

                    otherServicesBloc.changeSelectedDate(formattedDate);
                    dobController.text = formattedDate;
                  }
                },
                controller: dobController,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder<bool>(
            stream: otherServicesBloc.selectedYouAndOthers,
            builder: (context, snapshot) {
              return StreamBuilder<bool>(
                  stream: otherServicesBloc.selectedYourSelf,
                  builder: (context, snapshot1) {
                    return Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                    shape: const CircleBorder(),
                                    value: snapshot1.data ?? false,
                                    onChanged: (value) {
                                      otherServicesBloc
                                          .changeSelectedYouAndOthers(false);

                                      otherServicesBloc
                                          .changeSelectedYourSelf(value);
                                    }),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(right: 20),
                                  child: const Text("Just yourself"))
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                    shape: const CircleBorder(),
                                    value: snapshot.data ?? false,
                                    onChanged: (value) {
                                      otherServicesBloc
                                          .changeSelectedYourSelf(false);
                                      otherServicesBloc
                                          .changeSelectedYouAndOthers(value);
                                    }),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(right: 20),
                                  child: const Text(
                                      "Yourself & additional person"))
                            ]),
                      ],
                    );
                  });
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
            stream: otherServicesBloc.tMIValid,
            builder: (context, snapshot) {
              return StreamBuilder<bool>(
                  stream: otherServicesBloc.selectedYouAndOthers,
                  builder: (context, snapshot1) {
                    return StreamBuilder<bool>(
                        stream: otherServicesBloc.selectedYourSelf,
                        builder: (context, snapshot2) {
                          return CustomElevatedButton(
                              onTap: () {
                                if (!snapshot.hasData) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(AppConstants
                                              .pleaseFillAllFields)));
                                } else {
                            
                                  if (snapshot1.data==false &&
                                      snapshot2.data==false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(AppConstants
                                                .pleaseFillAllFields)));
                                  } else {
                                       otherServicesBloc.travelMeddicalInsuranceSubmit(context: context);
                                  }
                                }
                              },

                              //  !snapshot.hasData
                              //     ? () {
                              //         // otherServicesBloc.passPortSubmit(context: context);
                              //         print("not vaild");
                              //         ScaffoldMessenger.of(context).showSnackBar(
                              //             const SnackBar(
                              //                 content:
                              //                     Text(AppConstants.pleaseFillAllFields)));
                              //       }
                              //     : () {
                              //         // otherServicesBloc.passPortSubmit(context: context);
                              //       },
                              text: "Submit");
                        });
                  });
            }),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget checkBoxOne(String image) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: StreamBuilder(
          stream: otherServicesBloc.applicantName,
          builder: (context, AsyncSnapshot snapshot) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: const CircleBorder(),
                      value: snapshot.data,
                      onChanged: (value) => true,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Text("Accept all terms & conditions"))
                ]);
          }),
    );
  }
}
