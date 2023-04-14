import 'package:al_fifa/bloc/settings_bloc.dart';
import 'package:al_fifa/screens/homePage.dart';
import 'package:al_fifa/screens/myRequest/myRequest.dart';

import 'package:al_fifa/screens/screenOne.dart';
import 'package:al_fifa/screens/visaScreen/visa.dart';
import 'package:al_fifa/screens/visaScreen/visaScreenOne.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  late SettingsBloc settingsBloc;
  @override
  void initState() {
    settingsBloc = SettingsBloc();
    Future.delayed(const Duration(milliseconds: 100),
        () => {settingsBloc.changeUserLogin()});
    super.initState();
  }

  final pages = [
    const HomePage(),
    MyRequestScreen(),
    const Visa(
      backButton: false,
    )

    //drawer()
    // MenuScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[pageIndex], bottomNavigationBar: bottomNavbar(context));
  }

  Container bottomNavbar(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 0;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                ),
                pageIndex == 0
                    ? Image.asset(
                        "assets/Icons/home purple.png",
                        width: 25,
                        height: 25,
                      )
                    : Image.asset(
                        "assets/Icons/home.png",
                        width: 25,
                        height: 25,
                      ),
                // SizedBox(height: 10,),
                Text(
                  "Home",
                  style: TextStyle(
                    color: pageIndex == 0
                        ? AppColor.primaryColor
                        : AppColor.lightblackColor,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 0
                          ? AppColor.primaryColor
                          : Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 1;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                ),
                pageIndex == 1
                    ? Image.asset(
                        "assets/Icons/my request purple.png",
                        width: 25,
                        height: 25,
                      )
                    : Image.asset(
                        "assets/Icons/my request.png",
                        width: 25,
                        height: 25,
                      ),
                // SizedBox(height: 10,),
                Text(
                  "My Request",
                  style: TextStyle(
                      color: pageIndex == 1
                          ? AppColor.primaryColor
                          : AppColor.lightblackColor),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 1
                          ? AppColor.primaryColor
                          : Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 2;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                ),
                pageIndex == 2
                    ? Image.asset(
                        "assets/Icons/requirments purple.png",
                        width: 25,
                        height: 25,
                      )
                    : Image.asset(
                        "assets/Icons/requirments.png",
                        width: 25,
                        height: 25,
                      ),
                // SizedBox(height: 10,),
                Text("Visa Requirement",
                    style: TextStyle(
                        color: pageIndex == 2
                            ? AppColor.primaryColor
                            : AppColor.lightblackColor)),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 2
                          ? AppColor.primaryColor
                          : AppColor.lightblackColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                // pageIndex = 3;
                _showModelBottomSheet(settingsBloc);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                ),
                pageIndex == 3
                    ? Image.asset(
                        "assets/Icons/3 dots purple.png",
                        width: 25,
                        height: 25,
                      )
                    : Image.asset(
                        "assets/Icons/3 dots.png",
                        width: 25,
                        height: 25,
                      ),
                // SizedBox(height: 10,),
                Text("Menu",
                    style: TextStyle(
                        color: pageIndex == 3
                            ? AppColor.primaryColor
                            : AppColor.lightblackColor)),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 3
                          ? AppColor.primaryColor
                          : Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _showModelBottomSheet(SettingsBloc settingsBloc) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.white,
      elevation: 10,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        // UDE : SizedBox instead of Container for whitespaces
        return StreamBuilder<bool>(
            stream: settingsBloc.userLogin,
            builder: (context, loggedIn) {
              return Container(
                padding: const EdgeInsets.only(top: 16.0),
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    if (loggedIn.data == true)
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, myProfileScreen);
                        },
                        child: ListTile(
                          title: const Text(
                            "My Profile",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/user.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    if (loggedIn.data == true)
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, resetPasswordScreen);
                        },
                        child: ListTile(
                          title: const Text(
                            "Reset password",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/user.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    GestureDetector(
                        onTap: () {
                      
                          Navigator.pushReplacementNamed(context, aboutUS);
                        },
                        child: ListTile(
                          title: const Text(
                            "About Us",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/about us.png",
                            width: 30,
                            height: 30,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, contactus);
                        },
                        child: ListTile(
                          title: const Text(
                            "Contact Us",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/call.png",
                            width: 30,
                            height: 30,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: const Text(
                            "FAQ's",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/faqs.png",
                            width: 30,
                            height: 30,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: const Text(
                            "Notifications",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/notifications.png",
                            width: 30,
                            height: 30,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: const Text(
                            "Help",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/help.png",
                            width: 30,
                            height: 30,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: const Text(
                            "Term's & Conditions",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/my request.png",
                            width: 30,
                            height: 30,
                          ),
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: const Text(
                            "Privacy Policy",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/lock.png",
                            width: 30,
                            height: 30,
                          ),
                        )),
                    GestureDetector(
                        onTap: () async {
                          loggedIn.data == false
                              ? Navigator.pushReplacementNamed(
                                  context, "/loginPage")
                              : showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      // <-- SEE HERE
                                      title: const Text('Are you sure'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text('Do you want Logout ?'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('No'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Yes'),
                                          onPressed: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString("userEmailId", "");
                                            prefs.setBool("LoggedIn", false);
                                            settingsBloc.changeUserLogin();
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushReplacementNamed(
                                                context, "/loginPage");
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                        },
                        child: ListTile(
                          title: Text(
                            loggedIn.data == false ? "Login" : "Logout",
                            style: TextStyleAlFifa.text,
                          ),
                          leading: Image.asset(
                            "assets/Icons/logout.png",
                            width: 30,
                            height: 30,
                          ),
                        ))
                  ],
                ),
              );
            });
      },
    );
  }
}

// --- Button Widget --- //
