import 'package:al_fifa/bloc/visa_bloc.dart';
import 'package:al_fifa/models/Visa/country_model.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:search_choices/search_choices.dart';

class VisaScreenOne extends StatefulWidget {
  final bool backButtonIcon;
  final PageController pageController;
  final VisaBloc visaBloc;
  const VisaScreenOne(
      {Key? key,
      required this.visaBloc,
      required this.pageController,
      required this.backButtonIcon})
      : super(key: key);

  @override
  State<VisaScreenOne> createState() => _VisaScreenOneState();
}

class _VisaScreenOneState extends State<VisaScreenOne> {
  TextEditingController? controller;

  BuildContext? con;
  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 200),
        () => {
              widget.visaBloc.getNationality(context: context),
            });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            CustomAppBar(context, "Visa", backButton: widget.backButtonIcon),
            GlobeImage(),
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
                  border:
                      Border.all(color: AppColor.secondaryColor, width: 2.5),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: StreamBuilder<CountrylistModelResponse>(
                    stream: widget.visaBloc.nationality,
                    builder: (context,
                        AsyncSnapshot<CountrylistModelResponse> snapshot1) {
                      return StreamBuilder<Countrylist>(
                          stream: widget.visaBloc.selectedNationality,
                          builder: (context, snapshot2) {
                            return SearchChoices.single(
                              padding: const EdgeInsets.only(top: 05, left: 10),
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
                              searchInputDecoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15)),
                              items: (snapshot1.data != null
                                      ? snapshot1
                                          .data!.countrylistModel!.countrylist!
                                      : <Countrylist>[])
                                  .map((items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        items.countryname.toString(),
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Tajawal-Regular'),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: CachedNetworkImage(
                                          height: 20,
                                          placeholder: (context, url) {
                                            return Image.asset(
                                              "assets/Icons/earth.png",
                                            );
                                          },
                                          imageUrl:
                                              items.countryimage.toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              hint: "Select nationality",
                              searchHint: "Select one",
                              value: snapshot2.data ?? Countrydropdown(),
                              onChanged: (value) {
                                widget.visaBloc
                                    .changeSelectedNationality(value);
                              },
                              isExpanded: true,
                            );
                          });
                    })),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
                text: "Continue",
                onTap: () {
                  widget.pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
// visaBloc.resetpassword(context: context);
                  // Navigator.pushNamed(context, visaScreenTwo,arguments: visaBloc);
                }),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget GlobeImage() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset("assets/illustrations/world.png"),
      ),
    );
  }
}
