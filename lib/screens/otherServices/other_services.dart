import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OtherServices extends StatefulWidget {
  const OtherServices({super.key});

  @override
  State<OtherServices> createState() => _OtherServicesState();
}

class _OtherServicesState extends State<OtherServices> {
  TextEditingController _applicant_name = TextEditingController();
  String selectedValue = "USA";
  String? selectedServices;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "USA", child: Text("International Driving License ")),
      const DropdownMenuItem(value: "Canada", child: Text("Translation")),
      const DropdownMenuItem(value: "Brazil", child: Text("Book your stay")),
      const DropdownMenuItem(
          value: "England", child: Text("Escort by agent at embassy")),
      const DropdownMenuItem(
          value: "England1", child: Text("MOFA Attestation")),
      const DropdownMenuItem(
          value: "England2", child: Text("Travel Medical Insurance")),
    ];
    return menuItems;
  }

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
          CustomAppBar(context, "Other Services"),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                CustomDropDown(
                    hintText: "",
                    isShowPrefixIcon: false,
                    isShowSuffixIcon: false),
                const SizedBox(
                  height: 20,
                ),
                // interNationalDrivingLicense(),
                Column(
                  children: [
                    CustomDropDown2(),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text("Upload trans")
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                commanServices(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("photo.jpg  1.1MB"),
                    Row(
                      children: [
                        Image.asset(
                          "assets/Icons/camera.png",
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/Icons/photo.png",
                          width: 30,
                          height: 30,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/Icons/info purple.png",
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                        width: 300,
                        child: Text(
                            "Service Cost 219 SARCost Includes: Service fees, IDL License, Collection from one of our branches. Cost DOES NOT include courier delivery."))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CustomElevatedButton(
                        onTap: () {
                          Navigator.pushNamed(context, travelInformation);
                        },
                        text: "Submit")),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    )));
  }

  Column interNationalDrivingLicense() {
    return Column(
      children: [
        CustomDropDown2(
          hintText: "",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomDropDown2(
          hintText: "",
        ),
      ],
    );
  }

  Column commanServices() {
    return Column(
      children: [
        customTextField(_applicant_name, "Applicant name"),
        const SizedBox(
          height: 20,
        ),
        customTextField(_applicant_name, "Mobile number"),
        const SizedBox(
          height: 20,
        ),
        customTextField(_applicant_name, "Email"),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget CustomDropDown(
      {String? icon,
      String? hintText,
      bool? isShowPrefixIcon,
      bool? isShowSuffixIcon}) {
    return SizedBox(
      height: 60,
      child: FormField(builder: (FormFieldState<String> state) {
        return InputDecorator(
            decoration: InputDecoration(
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
                        Visibility(
                            visible: isShowSuffixIcon!,
                            child: Image.asset(
                              "assets/Icons/$icon",
                              width: 30,
                              height: 30,
                            )),
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
                prefixIcon: Visibility(
                  visible: isShowPrefixIcon!,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/Icons/$icon",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
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
                    selectedServices = newValue;
                  });
                },
              ),
            ));
      }),
    );
  }

  Widget CustomDropDown2({
    String? hintText,
  }) {
    return SizedBox(
      height: 60,
      child: FormField(builder: (FormFieldState<String> state) {
        return InputDecorator(
            decoration: InputDecoration(
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
                prefixIcon: Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
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
                    // selectedValue = newValue!;
                    // selectedServices=newValue;
                  });
                },
              ),
            ));
      }),
    );
  }
}
