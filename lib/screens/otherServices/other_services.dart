import 'package:al_fifa/Widgets/custom_loader.dart';
import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/other_services.dart';
import 'package:al_fifa/screens/otherServices/bookYourStay.dart';
import 'package:al_fifa/screens/otherServices/escort.dart';
import 'package:al_fifa/screens/otherServices/international.dart';
import 'package:al_fifa/screens/otherServices/mofa.dart';
import 'package:al_fifa/screens/otherServices/translation.dart';
import 'package:al_fifa/screens/otherServices/travel_medical_insurance.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
                                  items:
                                      AppConstants.otherServices.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
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
                      StreamBuilder<Map<String, dynamic>>(
                          stream: otherServicesBloc.selectedServices,
                          builder: (context, dataList) {
                            if (dataList.data == null) {
                              return Center(child: customLoader());
                            }
                            if (dataList.data!["type"].toString() ==
                                AppConstants.otherServices[0]["type"]
                                    .toString()) {
                              return InternationalDriving(
                                  otherServicesBloc: otherServicesBloc);
                            } else if (dataList.data!["type"].toString() ==
                                AppConstants.otherServices[1]["type"]
                                    .toString()) {
                              return Translation(
                                otherServicesBloc: otherServicesBloc,
                              );
                            } else if (dataList.data!["type"].toString() ==
                                AppConstants.otherServices[2]["type"]
                                    .toString()) {
                              return BookYourStay(
                                otherServicesBloc: otherServicesBloc,
                              );
                            } else if (dataList.data!["type"].toString() ==
                                AppConstants.otherServices[3]["type"]
                                    .toString()) {
                              return TravelMedicalInsurance(
                                otherServicesBloc: otherServicesBloc,
                              );
                            } else if (dataList.data!["type"].toString() ==
                                AppConstants.otherServices[4]["type"]
                                    .toString()) {
                              return Escort(
                                otherServicesBloc: otherServicesBloc,
                              );
                            } else if (dataList.data!["type"].toString() ==
                                AppConstants.otherServices[5]["type"]
                                    .toString()) {
                              return MOFA(
                                otherServicesBloc: otherServicesBloc,
                              );
                            } else {
                              return Container();
                            }
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
      ),
    );
  }
}
