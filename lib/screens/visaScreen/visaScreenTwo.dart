import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VisaScreenTwo extends StatefulWidget {
  const VisaScreenTwo({Key? key}) : super(key: key);

  @override
  State<VisaScreenTwo> createState() => _VisaScreenTwoState();
}

class _VisaScreenTwoState extends State<VisaScreenTwo> {
  TextEditingController? countryController;
  TextEditingController? visaTypeController;
  TextEditingController? locationController;
  TextEditingController? dateController;
  TextEditingController? promoCodeController;

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
  void initState() {
    // TODO: implement initState
    dateController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomAppBar(context, "Visa"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: CustomDropDown(
                    icon: "earth.png",
                    hintText: "",
                    isShowPrefixIcon: true,
                    isShowSuffixIcon: true),
              ),
              SizedBox(
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
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: CustomDropDown(
                    icon: "location.png",
                    hintText: "",
                    isShowPrefixIcon: true,
                    isShowSuffixIcon: false),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: 60,
                          width: width / 2.5,
                          child: CalendarTextField(dateController)),
                      Container(
                          height: 60,
                          width: width / 2.5,
                          child: CustomDropDown(
                              icon: "user.png",
                              hintText: "",
                              isShowSuffixIcon: false,
                              isShowPrefixIcon: true))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Do you have promo code?",
                  style: TextStyleAlFifa.normalText,
                ),
              ),
              customTextFieldIconsRight(
                  promoCodeController, "promo.png", "Enter Promo Code"),
              CustomElevatedButton(
                  text: "Submit Request",
                  onTap: () {
                    Navigator.pushNamed(context, visaRequest);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget RightAndLeftIconTextField(
      TextEditingController? controller, String icon, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
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
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/Icons/$icon",
                width: 20,
                height: 20,
              ),
            ),
            hintText: hintText),
      ),
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
                contentPadding: EdgeInsets.only(top: 8.0, bottom: 8.0),
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

  Widget CalendarTextField(TextEditingController? dateController) {
    return TextField(
      controller: dateController,
      //editing controller of this TextField
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
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
          prefixIcon: Icon(
            Icons.calendar_today,
            color: AppColor.secondaryColor,
          ),
          hintText: ""),
      readOnly: true,

      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));
        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            dateController?.text =
                formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
    );
  }
}
