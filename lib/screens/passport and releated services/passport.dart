import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/passport_bloc.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class Passport extends StatefulWidget {
  const Passport({super.key});

  @override
  State<Passport> createState() => _PassportState();
}

class _PassportState extends State<Passport> {
  late PassportBloc passportBloc;
  String selectedValue = "Passport Renewal";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Passport Renewal"), value: "Passport Renewal"),
      const DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      const DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      const DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 200),
        () => {
              passportBloc.changeSelectedIDType(AppConstants.idTypes[0]),
              passportBloc.changequantity(AppConstants.quantity[0]),
              passportBloc.getNationality(context: context),
            });
    // TODO: implement initState
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
                padding: const EdgeInsets.symmetric(horizontal: 40),
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
                      child: StreamBuilder(
                          stream: passportBloc.quantity,
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
                              items: AppConstants.quantity.map((items) {
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
                                passportBloc.changequantity(value);
                                AppConstants.logger(value.toString());
                              },
                            );
                          }),
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
                      // margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.secondaryColor, width: 2.5),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: StreamBuilder<CountrylistModelResponse>(
                          stream: passportBloc.nationality,
                          builder: (context,
                              AsyncSnapshot<CountrylistModelResponse>
                                  snapshot1) {
                            // if (snapshot.hasData) {
                            return StreamBuilder<Countrylist>(
                                stream: passportBloc.selectedNationality,
                                builder: (context,
                                    AsyncSnapshot<Countrylist> snapshot2) {
                                  return DropdownButtonFormField<Countrylist>(
                                    value: snapshot2.data ?? Countrylist(),
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                        "assets/Icons/drop down.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                    decoration: const InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    items: (snapshot1.data != null
                                            ? snapshot1.data!.countrylistModel!
                                                .countrylist!
                                            : <Countrylist>[])
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
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              items.countryname.toString(),
                                              style: customBRCobaneTextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.blackColor
                                                  // ignore: unrelated_type_equality_checks
                                                  ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      passportBloc.changeSelectedCountryIndex(
                                          snapshot1.data!.countrylistModel!
                                              .countrylist!
                                              .indexOf(value!));

                                      // print(value.)
                                      passportBloc
                                          .changeSelectedNationality(value);
                                      AppConstants.logger(value.toJson());
                                    },
                                  );
                                });
                            // }
                            // return Text("No data");
                          }),
                    ),

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
                      title: Text(
                        "Service Cost 119 SAR Cost Includes: Service fees, Appointment Booking & Form Filling, DOES NOT include Embassy Fees. (Passport renewal usually takes 15 to 35 days in Embassy)",
                        style: TextStyleAlFifa.mediumText,
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

  Widget CustomDropDown(
      {String? icon,
      String? hintText,
      bool? isShowPrefixIcon,
      List? dropdownItem,
      bool? isShowSuffixIcon}) {
    return SizedBox(
      height: 60,
      child: FormField(builder: (FormFieldState<String> state) {
        return InputDecorator(
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 30),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                        width: 5.0, color: AppColor.secondaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        width: 2.0, color: AppColor.secondaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        width: 3.0, color: AppColor.secondaryColor)),
                suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/Icons/drop down.png",
                          width: 20,
                          height: 20,
                        ),
                      ],
                    )),
                hintText: hintText),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: const Visibility(
                  visible: false,
                  child: Icon(Icons.arrow_downward),
                ),
                items: dropdownItems,
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
              ),
            ));
      }),
    );
  }
}
