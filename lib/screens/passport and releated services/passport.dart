import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/passport_bloc.dart';
import 'package:al_fifa/models/Visa/country_model.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:search_choices/search_choices.dart';

class Passport extends StatefulWidget {
  const Passport({super.key});

  @override
  State<Passport> createState() => _PassportState();
}

class _PassportState extends State<Passport> {
  late PassportBloc passportBloc;
  String selectedValue = "Passport Renewal";

  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 200),
        () => {
              passportBloc.changeSelectedIDType(AppConstants.idTypes[0]),
              passportBloc.changequantity(AppConstants.quantity[0]),
              passportBloc.getNationality(context: context),
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    passportBloc = Provider.of<PassportBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: LoaderOverlay(
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
                height: 20,
              ),
              CustomAppBar(context, "Passport"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // const CustomTextField(name: "",),
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
                        border: Border.all(
                            color: AppColor.secondaryColor, width: 2.5),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: StreamBuilder(
                          stream: passportBloc.selectedIDType,
                          builder: (context, AsyncSnapshot snapshot1) {
                            return DropdownButtonFormField<
                                Map<String, dynamic>>(
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
                              items: AppConstants.idTypes.map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        items["type"].toString(),
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
                                passportBloc.changeSelectedIDType(value);
                                AppConstants.logger(value.toString());
                              },
                            );
                          }),
                    ),
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
                        border: Border.all(
                            color: AppColor.secondaryColor, width: 2.5),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: [
                          const Text("Passport Quantity:",
                              style: TextStyleAlFifa.normalText),
                          Expanded(
                            child: StreamBuilder(
                                stream: passportBloc.quantity,
                                builder: (context, AsyncSnapshot snapshot1) {
                                  return SearchChoices.single(
                                    padding: const EdgeInsets.only(
                                        top: 05, left: 10),
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
                                    searchInputDecoration:
                                        const InputDecoration(
                                            hintStyle: TextStyle(fontSize: 15)),
                                    items: (AppConstants.quantity).map((items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              items["type"].toString(),
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontFamily:
                                                      'Tajawal-Regular'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    hint: "PassPort Quantity",
                                    searchHint: "Select one",
                                    value: snapshot1.data,
                                    onChanged: (value) {
                                      passportBloc.changequantity(value);
                                    },
                                    isExpanded: true,
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        // margin: const EdgeInsets.symmetric(
                        //   horizontal: 30,
                        // ),
                        // margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.secondaryColor, width: 2.5),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Country:",
                                style: TextStyleAlFifa.normalText),
                            Expanded(
                              child: StreamBuilder<CountrylistModelResponse>(
                                  stream: passportBloc.nationality,
                                  builder: (context,
                                      AsyncSnapshot<CountrylistModelResponse>
                                          snapshot1) {
                                    return StreamBuilder<Countrylist>(
                                        stream:
                                            passportBloc.selectedNationality,
                                        builder: (context, snapshot2) {
                                          return SearchChoices.single(
                                            padding: const EdgeInsets.only(
                                                top: 05, left: 10),
                                            underline: const SizedBox(),
                                            displayClearIcon: false,
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Image.asset(
                                                "assets/Icons/drop down.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                            searchInputDecoration:
                                                const InputDecoration(
                                                    hintStyle: TextStyle(
                                                        fontSize: 15)),
                                            items: (snapshot1.data != null
                                                    ? snapshot1
                                                        .data!
                                                        .countrylistModel!
                                                        .countrylist!
                                                    : <Countrylist>[])
                                                .map((items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      items.countryname
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontFamily:
                                                              'Tajawal-Regular'),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      child: CachedNetworkImage(
                                                        height: 20,
                                                        placeholder:
                                                            (context, url) {
                                                          return Image.asset(
                                                            "assets/Icons/earth.png",
                                                          );
                                                        },
                                                        imageUrl: items
                                                            .countryimage
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                            hint: "Select Country",
                                            searchHint: "Select one",
                                            value: snapshot2.data ??
                                                Countrydropdown(),
                                            onChanged: (value) {
                                              passportBloc
                                                  .changeSelectedNationality(
                                                      value);
                                            },
                                            isExpanded: true,
                                          );
                                        });
                                  }),
                            ),
                          ],
                        )),

                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder(
                        stream: passportBloc.applicantName,
                        builder: (context, snapshot) {
                          return CustomTextField(
                            name: "Applicant name",
                            errorText: (snapshot.error.toString() == 'null')
                                ? null
                                : snapshot.error.toString(),
                            onchanged: passportBloc.changeApplicantName,
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder(
                        stream: passportBloc.mobileNumber,
                        builder: (context, snapshot) {
                          return CustomTextField(
                            name: "Mobile number",
                            keyboardTypeNumber: true,
                            errorText: (snapshot.error.toString() == 'null')
                                ? null
                                : snapshot.error.toString(),
                            onchanged: passportBloc.changeMobileNumber,
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder(
                        stream: passportBloc.email,
                        builder: (context, snapshot) {
                          return CustomTextField(
                            name: "Email Id",
                            errorText: (snapshot.error.toString() == 'null')
                                ? null
                                : snapshot.error.toString(),
                            onchanged: passportBloc.changeEmail,
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
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Service Cost",
                                style: customBRCobaneTextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: AppColor.blackColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "119",
                                style: customBRCobaneTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: AppColor.primaryColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "SAR",
                                style: customBRCobaneTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: AppColor.primaryColor),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            " Service fees, Appointment Booking & Form Filling, DOES NOT include Embassy Fees. (Passport renewal usually takes 15 to 35 days in Embassy)",
                            style: TextStyleAlFifa.mediumText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<bool>(
                        stream: passportBloc.passportValid,
                        builder: (context, snapshot) {
                          print(snapshot.hasData);
                          return CustomElevatedButton(
                              onTap: !snapshot.hasData
                                  ? () {
                                      print("not vaild");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(AppConstants
                                                  .pleaseFillAllFields)));
                                    }
                                  : () {
                                      passportBloc.passPortSubmit(
                                          context: context);
                                    },
                              text: "Submit");
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
      ),
    );
  }
}
