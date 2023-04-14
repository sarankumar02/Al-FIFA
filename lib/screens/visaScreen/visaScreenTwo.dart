import 'package:al_fifa/Widgets/custom_date_picker.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/visa_bloc.dart';
import 'package:al_fifa/models/Visa/country_model.dart';
import 'package:al_fifa/models/Visa/visa_place_model.dart';
import 'package:al_fifa/models/Visa/visa_type_model.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:search_choices/search_choices.dart';

class VisaScreenTwo extends StatefulWidget {
  final VisaBloc visaBloc;
  final PageController pageController;
  const VisaScreenTwo(
      {Key? key, required this.visaBloc, required this.pageController})
      : super(key: key);

  @override
  State<VisaScreenTwo> createState() => _VisaScreenTwoState();
}

class _VisaScreenTwoState extends State<VisaScreenTwo> {
  TextEditingController travelDateController = TextEditingController();
  final List<int> _numbers = List.generate(20, (index) => index + 1);

  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 200),
        () => {
              // widget.visaBloc.getNationality(context: context),
              widget.visaBloc.getVisaType(context: context),
            });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        widget.pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        return false;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomAppBar(context, "Visa", onTap: () {
                widget.pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              }),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
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
                            Image.asset(
                              "assets/Icons/earth.png",
                              scale: 35,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Country:",
                                style: TextStyleAlFifa.normalText),
                            Expanded(
                              child: StreamBuilder<CountrylistModelResponse>(
                                  stream: widget.visaBloc.nationality,
                                  builder: (context,
                                      AsyncSnapshot<CountrylistModelResponse>
                                          snapshot1) {
                                    return StreamBuilder<Countrylist>(
                                        stream:
                                            widget.visaBloc.selectedNationality,
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
                                            hint: "Select nationality",
                                            searchHint: "Select one",
                                            value: snapshot2.data ??
                                                Countrydropdown(),
                                            onChanged: (value) {
                                              widget.visaBloc
                                                  .changeSelectedCountry(
                                                      context, value);
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
                            Image.asset(
                              "assets/Icons/visa.png",
                              scale: 35,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Visa Type:",
                                style: TextStyleAlFifa.normalText),
                            Expanded(
                              child: StreamBuilder<VisaTypeModelResponse>(
                                  stream: widget.visaBloc.visaType,
                                  builder: (context,
                                      AsyncSnapshot<VisaTypeModelResponse>
                                          snapshot1) {
                                    return StreamBuilder<Visatype>(
                                        stream:
                                            widget.visaBloc.selectedVisaType,
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
                                                        .visaTypeModel!
                                                        .visatype!
                                                    : <Visatype>[])
                                                .map((items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(
                                                  items.visaType.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Tajawal-Regular'),
                                                ),
                                              );
                                            }).toList(),
                                            hint: "Select visa type",
                                            searchHint: "Select one",
                                            value: snapshot2.data ?? Visatype(),
                                            onChanged: (value) {
                                              widget.visaBloc
                                                  .changeSelectedVisaType(
                                                      context, value);
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
                        child: SizedBox(
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/Icons/location.png",
                                scale: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Biometrics Location:",
                                  style: TextStyleAlFifa.normalText),
                              Expanded(
                                child: StreamBuilder<
                                        List<Map<dynamic, dynamic>>>(
                                    stream: widget.visaBloc.countries,
                                    builder: (context,
                                        AsyncSnapshot<
                                                List<Map<dynamic, dynamic>>>
                                            snapshot1) {
                                      return StreamBuilder<Map>(
                                          stream: widget
                                              .visaBloc.selectedVisaPlaces,
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
                                              items: (snapshot1.data ?? [])
                                                  .map((items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(
                                                    items["country"].toString(),
                                                    style:
                                                        customBRCobaneTextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColor
                                                                .blackColor),
                                                  ),
                                                );
                                              }).toList(),
                                              hint: "Select location",
                                              searchHint: "Select one",
                                              value: snapshot2.data,
                                              onChanged: (value) {
                                                widget.visaBloc
                                                    .changeSelectedVisaPlaces(
                                                        value);
                                              },
                                              isExpanded: true,
                                            );
                                          });
                                    }),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: StreamBuilder(
                          stream: widget.visaBloc.selectedDate,
                          builder: (context, snapshot1) {
                            return CustomDatePicker(
                              name: "Travel date",
                              onChange: (value) {
                                widget.visaBloc.changeSelectedDate(value);
                              },
                              errorText: (snapshot1.error.toString() == 'null')
                                  ? null
                                  : snapshot1.error.toString(),
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

                                  widget.visaBloc
                                      .changeSelectedDate(formattedDate);
                                  travelDateController.text = formattedDate;
                                }
                              },
                              controller: travelDateController,
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 150,
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
                                  Image.asset(
                                    "assets/Icons/user.png",
                                    scale: 35,
                                  ),
                                  Expanded(
                                    child: StreamBuilder<int>(
                                        stream: widget
                                            .visaBloc.selectedAdultTraveller,
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
                                            items: _numbers.map((items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(
                                                  items.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontFamily:
                                                          'Tajawal-Regular'),
                                                ),
                                              );
                                            }).toList(),
                                            hint: "Adult",
                                            searchHint: "Select one",
                                            value: snapshot2.data,
                                            onChanged: (value) {
                                              widget.visaBloc
                                                  .changeSelectedAdultTraveller(
                                                      value);
                                              print(snapshot2.data);
                                            },
                                            isExpanded: true,
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 60,
                              width: 150,
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
                                  Image.asset(
                                    "assets/Icons/user.png",
                                    scale: 35,
                                  ),
                                  Expanded(
                                    child: StreamBuilder<int>(
                                        stream: widget
                                            .visaBloc.selectedChildTraveller,
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
                                            items: _numbers.map((items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(
                                                  items.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 17,
                                                      fontFamily:
                                                          'Tajawal-Regular'),
                                                ),
                                              );
                                            }).toList(),
                                            hint: "Child",
                                            searchHint: "Select one",
                                            value: snapshot2.data,
                                            onChanged: (value) {
                                              widget.visaBloc
                                                  .changeSelectedChildTraveller(
                                                      value);
                                            },
                                            isExpanded: true,
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<VisaPlaceModelResponse>(
                        stream: widget.visaBloc.visaPlaces,
                        builder: (context, snapshot) {
                          return StreamBuilder<int>(
                              stream: widget.visaBloc.selectedAdultTraveller,
                              builder: (context, snapshot1) {
                                return StreamBuilder<int>(
                                    stream:
                                        widget.visaBloc.selectedChildTraveller,
                                    builder: (context, snapshot2) {
                                      if (snapshot1.hasData ||
                                          snapshot2.hasData) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
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
                                                      style:
                                                          customBRCobaneTextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color: AppColor
                                                                  .blackColor),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "${int.parse(snapshot.data!.visaPlaceModel!.visaplaces[0].travelersPrice.adults) * int.parse(snapshot1.data.toString() == "null" ? "0" : snapshot1.data.toString()) + int.parse(snapshot2.data.toString() == "null" ? "0" : snapshot.data!.visaPlaceModel!.visaplaces[0].travelersPrice.children) * int.parse(snapshot2.data.toString() == "null" ? "0" : snapshot2.data.toString())}",
                                                      style:
                                                          customBRCobaneTextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color: AppColor
                                                                  .primaryColor),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "SAR",
                                                      style:
                                                          customBRCobaneTextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color: AppColor
                                                                  .primaryColor),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                    "Price Includes: Appointment Service, Translation,VAT & Insurance* Fees. Price Excludes:Submission Fees & Passport Shipment From VFS"),
                                              ],
                                            ),

                                            // Text(
                                            //   "Service Cost ${int.parse(snapshot.data!.visaPlaceModel!.visaplaces[0].travelersPrice.adults) * int.parse(snapshot1.data.toString() == "null" ? "0" : snapshot1.data.toString()) + int.parse(snapshot2.data.toString() == "null" ? "0" : snapshot.data!.visaPlaceModel!.visaplaces[0].travelersPrice.children) * int.parse(snapshot2.data.toString() == "null" ? "0" : snapshot2.data.toString())} SAR Cost Includes: Service fees, Appointment Booking & Form Filling, DOES NOT include Embassy Fees. (Passport renewal usually takes 15 to 35 days in Embassy)",
                                            //   style: TextStyleAlFifa.mediumText,
                                            // ),
                                          ),
                                        );
                                      }
                                      return Container();
                                    });
                              });
                        }),
                    StreamBuilder<bool>(
                        stream: widget.visaBloc.visaOneValid,
                        builder: (context, snapshot) {
                          return CustomElevatedButton(
                              text: "Submit Request",
                              onTap: snapshot.hasData
                                  ? () async {
                                      // Navigator.pushNamed(context, visaRequest);
                                      if (await widget.visaBloc
                                          .visaValidation()) {
                                        widget.pageController.animateToPage(2,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeIn);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(AppConstants
                                                    .pleaseFillAllFields)));
                                      }
                                    }
                                  : () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(AppConstants
                                                  .pleaseFillAllFields)));
                                    });
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
