import 'package:al_fifa/Widgets/custom_date_picker.dart';
import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/other_services.dart';
import 'package:al_fifa/screens/otherServices/other_services.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookYourStay extends StatelessWidget {
  final OtherServicesBloc otherServicesBloc;
  BookYourStay({super.key, required this.otherServicesBloc});
  TextEditingController checkInController = TextEditingController();
  TextEditingController checkOutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream: otherServicesBloc.toPlace,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "To place",
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeToPlace,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.selectedCheckIn,
            builder: (context, snapshot) {
              return Column(
                children: [
                  CustomDatePicker(
                    name: "Check in",
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
                          firstDate: DateTime
                              .now(), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2050));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat(AppConstants.YYYMMDDFormat)
                                .format(pickedDate);
                        checkInController.text = formattedDate;

                        otherServicesBloc.changeSelectedCheckIn(formattedDate);
                        checkOutController.clear();
                        otherServicesBloc
                            .changeSelectedCheckOut(null);
                      }
                    },
                    controller: checkInController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                      stream: otherServicesBloc.selectedCheckOut,
                      builder: (context, snapshot1) {
                        return CustomDatePicker(
                          name: "Check out",
                          onChange: (value) {
                            otherServicesBloc.changeSelectedDate(value);
                          },
                          errorText: (snapshot1.error.toString() == 'null')
                              ? null
                              : snapshot1.error.toString(),
                          onTap: () async {
                            DateTime checkInValue =
                                DateTime.parse(snapshot.data.toString());
                            if (snapshot.data != null) {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(checkInValue.year,
                                      checkInValue.month, checkInValue.day),
                                  firstDate: DateTime(
                                      checkInValue.year,
                                      checkInValue.month,
                                      checkInValue
                                          .day), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2050));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat(AppConstants.YYYMMDDFormat)
                                        .format(pickedDate);

                                otherServicesBloc
                                    .changeSelectedCheckOut(formattedDate);
                                checkOutController.text = formattedDate;
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Please select check in date")));
                            }
                          },
                          controller: checkOutController,
                        );
                      }),
                ],
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
            "Service Cost 119 SAR Cost Includes: Service fees, Appointment Booking & Form Filling, DOES NOT include Embassy Fees. (Passport renewal usually takes 15 to 35 days in Embassy)",
            style: TextStyleAlFifa.mediumText,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder<bool>(
            stream: otherServicesBloc.bysValid,
            builder: (context, snapshot) {
              print(snapshot.hasData);
              return CustomElevatedButton(
                  onTap: !snapshot.hasData
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text(AppConstants.pleaseFillAllFields)));
                        }
                      : () {
                          otherServicesBloc.bookYourStaySubmit(
                              context: context);
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
