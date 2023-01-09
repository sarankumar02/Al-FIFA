import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class TravelInformation extends StatefulWidget {
  const TravelInformation({Key? key}) : super(key: key);

  @override
  State<TravelInformation> createState() => _TravelInformationState();
}

class _TravelInformationState extends State<TravelInformation> {
  TextEditingController? fNameController;
  TextEditingController? lNameController;
  TextEditingController? motherFNameController;
  TextEditingController? motherLNameController;

  String selectedValue = "USA";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const  SizedBox(
                height: 40,
              ),
              CustomAppBar(context, "Travel Information"),
            const  SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                child: Text(
                  "Traveler's Information",
                  style: TextStyleAlFifa.text,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              travelerFLName(width),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              uploadPassport(width),
              SizedBox(
                height: 20,
              ),
              uploadPhoto(width),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                child: Text(
                  "Mother's Information",
                  style: TextStyleAlFifa.text,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              motherInformation(width),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: CustomDropDown(
                    icon: "",
                    hintText: "",
                    isShowPrefixIcon: false,
                    isShowSuffixIcon: false),
              ),
              SizedBox(
                height: height / 6,
              ),
              CustomElevatedButton(
                  onTap: () {
                    Navigator.pushNamed(context, paymentScreen);
                  },
                  text: "Proceed Payment"),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget travelerFLName(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            height: 50,
            width: width / 2.5,
            child: customTextField(fNameController, "First Name")),
        Container(
            height: 50,
            width: width / 2.5,
            child: customTextField(lNameController, "Last Name"))
      ],
    );
  }

  Widget uploadPassport(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(left: 30),
            // height: 50,
            // width: width/2.5,
            child: Text("Upload Passport")),
        Container(
            // height: 50,
            //  width: width/2.5,
            padding: EdgeInsets.only(right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/Icons/camera.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset("assets/Icons/photo.png",
                      width: 30, height: 30),
                )
              ],
            ))
      ],
    );
  }

  Widget uploadPhoto(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.center,
            // height: 50,
            //  width: width/2.5,
            child: Text("Upload Photo")),
        Container(
            // height: 50,
            // width: width/2.5,
            padding: EdgeInsets.only(right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/Icons/camera.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset("assets/Icons/photo.png",
                      width: 30, height: 30),
                )
              ],
            ))
      ],
    );
  }

  Widget motherInformation(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            height: 50,
            width: width / 2.5,
            child: customTextField(motherFNameController, "First Name")),
        Container(
            height: 50,
            width: width / 2.5,
            child: customTextField(motherLNameController, "Last Name"))
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
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide:
                        BorderSide(width: 5.0, color: AppColor.secondaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(width: 2.0, color: AppColor.secondaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(width: 3.0, color: AppColor.secondaryColor)),
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
                        SizedBox(
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
                icon: Visibility(
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
