import 'package:al_fifa/bloc/settings_bloc.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport_thankyou.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SettingsBloc settingsBloc;
  @override
  void initState() {
    settingsBloc=SettingsBloc();
     
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: const Text(
                    "arabic",
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                ),
                Image.asset(
                  "assets/Logos/Alfifa logo.png",
                  width: 150,
                  height: 150,
                ),

                ListView(shrinkWrap: true, children: [
                  CarouselSlider(
                    items: [
                      Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Image(
                            image: AssetImage("assets/Images/Clip.png"),
                            width: 300,
                            // height: 50,
                            fit: BoxFit.fill,
                          )),
                      Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Image(
                            image: AssetImage("assets/Images/Clip.png"),
                            width: 300,
                            // height: 50,
                            fit: BoxFit.fill,
                          )),
                      Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Image(
                            image: AssetImage("assets/Images/Clip.png"),
                            width: 300,
                            // height: 50,
                            fit: BoxFit.fill,
                          )),
                      Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Image(
                            image: AssetImage("assets/Images/Clip.png"),
                            width: 300,
                            // height: 50,
                            fit: BoxFit.fill,
                          )),
                    ],
                    options: CarouselOptions(
                      height: 140.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(seconds: 1),
                      viewportFraction: 0.8,
                    ),
                  ),
                ]),

                // Container(
                //   height: 160,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 2,
                //     itemBuilder: (context, i) {
                //       return Column(
                //         children: [
                //           Card(
                //             elevation: 5,
                //             clipBehavior: Clip.antiAlias,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(20)),
                //             child: Image(image: AssetImage("assets/illustrations/dummy.png"),
                //             width: 300,
                //             height: 150,
                //             fit: BoxFit.fill,)
                //           ),
                //           // Container(
                //           //   height: 10,
                //           //   width: 10,
                //           //   decoration: BoxDecoration(
                //           //       color: AppColor.primaryColor,
                //           //       shape: BoxShape.circle),
                //           // )
                //         ],
                //       );
                //     },
                //   ),
                // ),
                // Container(
                //   height: 10,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 2,
                //     itemBuilder: (context, i) {
                //       return Container(
                //         height: 10,
                //         width: 10,
                //         decoration: BoxDecoration(
                //             color: AppColor.primaryColor,
                //             shape: BoxShape.circle),
                //       );
                //     },
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var internetConntion =
                            await settingsBloc.checkInternetConnection();
                        internetConntion
                            ? Navigator.pushNamed(context, passport)
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        AppConstants.pleaseCheckInternet)));
                        ;
                      },
                      child: Column(
                        children: const [
                          Image(
                            image:
                                AssetImage("assets/illustrations/passport.png"),
                            width: 100,
                          ),
                          Text(
                            "Passport & \nrelated services",
                            style: TextStyle(
                                fontFamily: "Tajawal-Bold",
                                color: AppColor.lightblackColor),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var internetConntion =
                            await settingsBloc.checkInternetConnection();
                        internetConntion
                            ? Navigator.pushNamed(context, visaScreenOne)
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        AppConstants.pleaseCheckInternet)));
                      },
                      child: Column(
                        children: const [
                          Image(
                            image: AssetImage(
                              "assets/illustrations/visa.png",
                            ),
                            width: 100,
                          ),
                          Text(
                            "Visa \n ",
                            style: TextStyle(
                                fontFamily: "Tajawal-Bold",
                                color: AppColor.lightblackColor),
                          )
                        ],
                      ),
                    ),
                    StreamBuilder<bool>(
                      stream: settingsBloc.userLogin,
                      builder: (context, snapshot) {
                        return GestureDetector(
                          onTap: () {
                            // settingsBloc.changeUserLogin();
                            print(snapshot.data);
                            // Navigator.pushReplacement(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return const PassportThankyou(title: "mff",message: "dmm",);
                            //   },
                            // ));
                          },
                          child: Column(
                            children: const [
                              Image(
                                image: AssetImage(
                                    "assets/illustrations/travel packages.png"),
                                width: 100,
                              ),
                              Text(
                                "Packages Stay &\nTravel",
                                style: TextStyle(
                                    fontFamily: "Tajawal-Bold",
                                    color: AppColor.lightblackColor),
                              )
                            ],
                          ),
                        );
                      }
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    var internetConntion =
                        await settingsBloc.checkInternetConnection();
                    internetConntion
                        ? Navigator.pushNamed(context, otherServices)
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text(AppConstants.pleaseCheckInternet)));
                  },
                  child: Container(
                    height: 250,
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Stack(
                              alignment: AlignmentDirectional.topStart,
                              children: [
                                Card(
                                  elevation: 5,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Image(
                                    image:
                                        AssetImage("assets/Images/person.jpg"),
                                    width: 320,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 20, top: 150),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Image(
                                        image: AssetImage(
                                            "assets/Icons/other services.png"),
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        "Other Services",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                      ),
                                      Text("International driving ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white))
                                    ],
                                  ),
                                ),
                              ]);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
