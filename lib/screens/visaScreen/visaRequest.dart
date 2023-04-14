import 'package:al_fifa/bloc/visa_bloc.dart';
import 'package:al_fifa/models/Visa/country_model.dart';
import 'package:al_fifa/models/Visa/visa_requirement_model.dart';
import 'package:al_fifa/models/Visa/visa_type_model.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class VisaRequestScreen extends StatefulWidget {
  final VisaBloc visaBloc;
  final PageController pageController;
  const VisaRequestScreen(
      {Key? key, required this.visaBloc, required this.pageController})
      : super(key: key);

  @override
  State<VisaRequestScreen> createState() => _VisaRequestScreenState();
}

class _VisaRequestScreenState extends State<VisaRequestScreen> {
  String selectedValue = "USA";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("USA"), value: "USA"),
      const DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      const DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      const DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: SingleChildScrollView(
          child: StreamBuilder<VisaRequirementModelResponse>(
              stream: widget.visaBloc.getVisaRequirement(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return WillPopScope(
                    onWillPop: () async {
                      widget.pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                      return false;
                    },
                    child: Column(
                      children: [
                        CustomAppBar(context, "Visa", onTap: () {
                          widget.pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(children: [
                            Container(
                              height: 60,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              // margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.secondaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Image.asset(
                                      "assets/Icons/earth.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  StreamBuilder<Countrylist>(
                                    stream: widget.visaBloc.selectedNationality,
                                    builder: (context, snapshot) {
                                      return Text(
                                          "Country: ${snapshot.data!.countryname.toString()}");
                                    },
                                  ),
                                  //   Image.asset(
                                  //   "assets/Icons/drop down.png",
                                  //   width: 20,
                                  //   height: 20,
                                  // ),
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
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              // margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.secondaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Image.asset(
                                      "assets/Icons/visa.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  StreamBuilder<Visatype>(
                                    stream: widget.visaBloc.selectedVisaType,
                                    builder: (context, snapshot) {
                                      return Text(
                                          "VisaType: ${snapshot.data!.visaType.toString()}");
                                    },
                                  ),
                                  //   Image.asset(
                                  //   "assets/Icons/drop down.png",
                                  //   width: 20,
                                  //   height: 20,
                                  // ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/Icons/info purple.png",
                                  width: 25,
                                  height: 25,
                                ),
                                title: Text(
                                  "You can submit your visa application now. The required documents can be prepared 2-3 days before biometrics date.",
                                  style: TextStyleAlFifa.mediumText,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.visaRequirementModel!
                                    .requirements!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          snapshot.data!.visaRequirementModel!
                                              .requirements![index].title
                                              .toString(),
                                          style: TextStyleAlFifa.text,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        HtmlWidget(
                                          snapshot.data!.visaRequirementModel!
                                              .requirements![index].descriptions
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: CustomElevatedButton(
                                    onTap: () {
                                      widget.pageController.animateToPage(3,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                      // Navigator.pushNamed(context, travelInformation);
                                    },
                                    text: "Start a Visa Request")),
                          ]),
                        )
                      ],
                    ),
                  );
                  ;
                }
                return Container();
              })),
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
                  });
                },
              ),
            ));
      }),
    );
  }
}
