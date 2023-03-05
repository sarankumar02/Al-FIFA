import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class VisaRequestScreen extends StatefulWidget {
  const VisaRequestScreen({Key? key}) : super(key: key);

  @override
  State<VisaRequestScreen> createState() => _VisaRequestScreenState();
}

class _VisaRequestScreenState extends State<VisaRequestScreen> {
  String selectedValue = "USA";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USA", child: Text("USA")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            const SizedBox(
              height: 40,
            ),

            CustomAppBar(context, "Visa"),
            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CustomDropDown(
                  icon: "earth.png",
                  hintText: "",
                  isShowPrefixIcon: true,
                  isShowSuffixIcon: true),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: CustomDropDown(
                    icon: "visa.png",
                    hintText: "",
                    isShowPrefixIcon: true,
                    isShowSuffixIcon: false)),

            SizedBox(
              height: height/2,
            ),

            Align(
                alignment: FractionalOffset.bottomCenter,
                child: CustomElevatedButton(
                    onTap: () {
                      Navigator.pushNamed(context, travelInformation);
                    }, text: "Start a Visa Request"))

          ])),
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
                    borderSide:
                        const BorderSide(width: 5.0, color: AppColor.secondaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                    const BorderSide(width: 2.0, color: AppColor.secondaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                    const BorderSide(width: 3.0, color: AppColor.secondaryColor)),
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
                  });
                },
              ),
            ));
      }),
    );
  }
}
