import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/other_services.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class OtherServices extends StatefulWidget {
  const OtherServices({super.key});

  @override
  State<OtherServices> createState() => _OtherServicesState();
}

class _OtherServicesState extends State<OtherServices> {
  late OtherServicesBloc otherServicesBloc;
  @override
  void initState() {
    otherServicesBloc = OtherServicesBloc();
    Future.delayed(
        const Duration(milliseconds: 200),
        () => {
              otherServicesBloc
                  .changeSelectedServices(AppConstants.otherServices[0]),
            });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // otherServicesBloc = Provider.of<OtherServicesBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomAppBar(context, "Other Services"),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        // margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.secondaryColor, width: 2.5),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: StreamBuilder(
                            stream: otherServicesBloc.selectedServices,
                            builder: (context, AsyncSnapshot snapshot) {
                              return DropdownButtonFormField<
                                  Map<String, dynamic>>(
                                value: snapshot.data,
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
                                items: AppConstants.otherServices.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
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
                                onChanged: (value) {
                                  otherServicesBloc
                                      .changeSelectedServices(value);
                                },
                              );
                            })),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder(
                        stream: otherServicesBloc.selectedServices,
                        builder: (context, dataList) {
                          return Column( children: [
                              if (dataList.data == AppConstants.otherServices[0]) 
                             Column(
                              children: [
                                Container(
                                    height: 60,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    // margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.secondaryColor,
                                          width: 2.5),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: StreamBuilder(
                                        stream: otherServicesBloc.quantity,
                                        builder:
                                            (context, AsyncSnapshot snapshot1) {
                                          return DropdownButtonFormField<
                                              Map<String, dynamic>>(
                                            value: snapshot1.data,
                                            decoration: const InputDecoration(
                                                enabledBorder: InputBorder.none,
                                                border: InputBorder.none),
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Image.asset(
                                                "assets/Icons/drop down.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                            items: AppConstants.quantity
                                                .map((items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 10),
                                                    child: Text(
                                                      "${items["type"]}",
                                                      style:
                                                          customBRCobaneTextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColor
                                                                  .blackColor),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            hint: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 18.0, top: 8.0),
                                              child: Text(
                                                "IDL Quantity",
                                                textAlign: TextAlign.center,
                                                style:
                                                    TextStyleAlFifa.normalText,
                                              ),
                                            ),
                                            onChanged: (value) {
                                              otherServicesBloc
                                                  .changequantity(value);
                                              print("ajf${snapshot1.data}");
                                              // otherServicesBloc.changeSelectedIDType(value);
                                              AppConstants.logger(
                                                  value.toString());
                                            },
                                          );
                                        })),
                                const SizedBox(
                                  height: 20,
                                ),
                                StreamBuilder(
                                    stream: otherServicesBloc
                                        .lincenseCollectionChoice,
                                    builder: (context, snapshot) {
                                      return CustomTextField(
                                        name: "Lincense collection choice",
                                        errorText: (snapshot.error.toString() ==
                                                'null')
                                            ? null
                                            : snapshot.error.toString(),
                                        onchanged: otherServicesBloc
                                            .changeLincenseCollectionChoice,
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
                                        errorText:
                                            (valueMOFA.error.toString() ==
                                                    'null')
                                                ? null
                                                : valueMOFA.error.toString(),
                                        onchanged: otherServicesBloc
                                            .changeApplicantName,
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
                                        errorText:
                                            (valueMOFA.error.toString() ==
                                                    'null')
                                                ? null
                                                : valueMOFA.error.toString(),
                                        onchanged: otherServicesBloc
                                            .changeMobileNumber,
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
                                        errorText:
                                            (valueMOFA.error.toString() ==
                                                    'null')
                                                ? null
                                                : valueMOFA.error.toString(),
                                        onchanged:
                                            otherServicesBloc.changeEmail,
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
                                                  otherServicesBloc
                                                      .passPortSubmit(
                                                          context: context);
                                                  print("not vaild");
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(AppConstants
                                                              .pleaseFillAllFields)));
                                                }
                                              : () {
                                                  otherServicesBloc
                                                      .passPortSubmit(
                                                          context: context);
                                                },
                                          text: "Submit");
                                    }),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                            
                              if (dataList.data == AppConstants.otherServices[2]) 
                             Column(
                              children: [
                            
                            
                                StreamBuilder(
                                    stream: otherServicesBloc.applicantNameBYS,
                                    builder: (context, valueMOFA) {
                                      return CustomTextField(
                                        name: "Applicant name",
                                        errorText:
                                            (valueMOFA.error.toString() ==
                                                    'null')
                                                ? null
                                                : valueMOFA.error.toString(),
                                        onchanged: otherServicesBloc
                                            .changeApplicantNameBYS,
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                StreamBuilder(
                                    stream: otherServicesBloc.mobileNumberBYS,
                                    builder: (context, valueMOFA) {
                                      return CustomTextField(
                                        name: "Mobile number",
                                        errorText:
                                            (valueMOFA.error.toString() ==
                                                    'null')
                                                ? null
                                                : valueMOFA.error.toString(),
                                        onchanged: otherServicesBloc
                                            .changeMobileNumberBYS,
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                StreamBuilder(
                                    stream: otherServicesBloc.emailBYS,
                                    builder: (context, valueMOFA) {
                                      return CustomTextField(
                                        name: "Email Id",
                                        errorText:
                                            (valueMOFA.error.toString() ==
                                                    'null')
                                                ? null
                                                : valueMOFA.error.toString(),
                                        onchanged:
                                            otherServicesBloc.changeEmailBYS,
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
                                    stream: otherServicesBloc.bys,
                                    builder: (context, snapshot) {
                                      print(snapshot.hasData);
                                      return CustomElevatedButton(
                                          onTap: !snapshot.hasData
                                              ? () {
                                                  otherServicesBloc
                                                      .passPortSubmit(
                                                          context: context);
                                                  print("not vaild");
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(AppConstants
                                                              .pleaseFillAllFields)));
                                                }
                                              : () {
                                                  otherServicesBloc
                                                      .passPortSubmit(
                                                          context: context);
                                                },
                                          text: "Submit");
                                    }),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                            
                            
                            // if (dataList.data ==
                            //   AppConstants.otherServices[2]) 
                            //  Column(
                            //   children: [
                            //     StreamBuilder(
                            //         stream: otherServicesBloc.applicantNameBYS,
                            //         builder: (context, valueBYS) {
                            //           return CustomTextField(
                            //             name: "Applicant name",
                            //             errorText:
                            //                 (valueBYS.error.toString() ==
                            //                         'null')
                            //                     ? null
                            //                     : valueBYS.error.toString(),
                            //             onchanged: otherServicesBloc
                            //                 .changeApplicantNameBYS,
                            //           );
                            //         }),
                            //     const SizedBox(
                            //       height: 20,
                            //     ),
                            //     StreamBuilder(
                            //         stream: otherServicesBloc.mobileNumberBYS,
                            //         builder: (context, valueBYS) {
                            //           return CustomTextField(
                            //             name: "Mobile number",
                            //             errorText: (valueBYS.error.toString() ==
                            //                     'null')
                            //                 ? null
                            //                 : valueBYS.error.toString(),
                            //             onchanged: otherServicesBloc
                            //                 .changeMobileNumberBYS,
                            //           );
                            //         }),
                            //     const SizedBox(
                            //       height: 20,
                            //     ),
                            //     StreamBuilder(
                            //         stream: otherServicesBloc.emailBYS,
                            //         builder: (context, valueBYS) {
                            //           return CustomTextField(
                            //             name: "Email Id",
                            //             errorText: (valueBYS.error.toString() ==
                            //                     'null')
                            //                 ? null
                            //                 : valueBYS.error.toString(),
                            //             onchanged:
                            //                 otherServicesBloc.changeEmailBYS,
                            //           );
                            //         }),
                            //     const SizedBox(
                            //       height: 20,
                            //     ),
                            //     ListTile(
                            //       leading: Image.asset(
                            //         "assets/Icons/info purple.png",
                            //         width: 25,
                            //         height: 25,
                            //       ),
                            //       title: Text(
                            //         "Cost will be determined after reviewing the documents.",
                            //         style: TextStyleAlFifa.mediumText,
                            //       ),
                            //     ),
                            //     StreamBuilder<bool>(
                            //         stream: otherServicesBloc.eSCORT,
                            //         builder: (context, valueBYS) {
                                   
                            //           return CustomElevatedButton(
                            //               onTap: !valueBYS.hasData
                            //                   ? () {
                            //                       ScaffoldMessenger.of(context)
                            //                           .showSnackBar(const SnackBar(
                            //                               content: Text(AppConstants
                            //                                   .pleaseFillAllFields)));
                            //                     }
                            //                   : () {
                            //                       otherServicesBloc
                            //                           .passPortSubmit(
                            //                               context: context);
                            //                     },
                            //               text: "Submit");
                            //         }),
                            //   ],
                            // ),
                            if (dataList.data ==
                              AppConstants.otherServices[4]) 
                             Column(
                              children: [
                                StreamBuilder(
                                    stream:
                                        otherServicesBloc.applicantNameESCORT,
                                    builder: (context, snapshot4) {
                                      return CustomTextField(
                                        name: "Applicant name",
                                        errorText:
                                            (snapshot4.error.toString() ==
                                                    'null')
                                                ? null
                                                : snapshot4.error.toString(),
                                        onchanged: otherServicesBloc
                                            .changeApplicantNameESCORT,
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                StreamBuilder(
                                    stream:
                                        otherServicesBloc.mobileNumberESCORT,
                                    builder: (context, valueESCOT) {
                                      return CustomTextField(
                                        name: "Mobile number",
                                        errorText: (valueESCOT.error.toString() ==
                                                'null')
                                            ? null
                                            : valueESCOT.error.toString(),
                                        onchanged: otherServicesBloc
                                            .changeMobileNumberESCORT,
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                StreamBuilder(
                                    stream: otherServicesBloc.emailESCORT,
                                    builder: (context, valueESCOT) {
                                      return CustomTextField(
                                        name: "Email Id",
                                        errorText: (valueESCOT.error.toString() ==
                                                'null')
                                            ? null
                                            : valueESCOT.error.toString(),
                                        onchanged:
                                            otherServicesBloc.changeEmailESCORT,
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
                                    stream: otherServicesBloc.eSCORT,
                                    builder: (context, valueESCOT) {
                                      print(valueESCOT.hasData);
                                      return CustomElevatedButton(
                                          onTap: !valueESCOT.hasData
                                              ? () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(AppConstants
                                                              .pleaseFillAllFields)));
                                                }
                                              : () {
                                                  otherServicesBloc
                                                      .passPortSubmit(
                                                          context: context);
                                                },
                                          text: "Submit");
                                    }),
                              ],
                            ),
                          
                          if (dataList.data == AppConstants.otherServices[5]) 
                             Column(
                              children: [
                                StreamBuilder(
                                    stream: otherServicesBloc.applicantNameMOFA,
                                    builder: (context, snapshot2) {
                                      return CustomTextField(
                                        name: "Applicant name",
                                        errorText:
                                            (snapshot2.error.toString() ==
                                                    'null')
                                                ? null
                                                : snapshot2.error.toString(),
                                        onchanged: otherServicesBloc
                                            .changeApplicantNameMOFA,
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                StreamBuilder(
                                    stream: otherServicesBloc.mobileNumberMOFA,
                                    builder: (context, snapshot) {
                                      return CustomTextField(
                                        name: "Mobile number",
                                        errorText: (snapshot.error.toString() ==
                                                'null')
                                            ? null
                                            : snapshot.error.toString(),
                                        onchanged: otherServicesBloc
                                            .changeMobileNumberMOFA,
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                StreamBuilder(
                                    stream: otherServicesBloc.emailMOFA,
                                    builder: (context, snapshot) {
                                      return CustomTextField(
                                        name: "Email Id",
                                        errorText: (snapshot.error.toString() ==
                                                'null')
                                            ? null
                                            : snapshot.error.toString(),
                                        onchanged:
                                            otherServicesBloc.changeEmailMOFA,
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
                                    stream: otherServicesBloc.mOFAValid,
                                    builder: (context, valuex) {
                                      return CustomElevatedButton(
                                          onTap: !valuex.hasData
                                              ? () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(AppConstants
                                                              .pleaseFillAllFields)));
                                                }
                                              : () {
                                                  otherServicesBloc
                                                      .passPortSubmit(
                                                          context: context);
                                                },
                                          text: "Submit");
                                    }),
                              ],
                            )
                          
                          ],);
                        
                          return Container();
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )),
      ),
    );
  }
}
