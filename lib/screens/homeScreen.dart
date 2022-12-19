import 'package:al_fifa/screens/homePage.dart';
import 'package:al_fifa/screens/screenOne.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = [
    HomePage(),
    ScreenOne(
      text: "My Request",
    ),
    ScreenOne(
      text: "Visa Requirement",
    ),
    ScreenOne(
      text: "Menu",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[pageIndex], bottomNavigationBar: bottomNavbar(context));
  }

  Container bottomNavbar(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
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
                SizedBox(
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
                        : AppColor.blackColor,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 0
                          ? AppColor.primaryColor
                          : AppColor.blackColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
                SizedBox(
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
                          : AppColor.blackColor),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 1
                          ? AppColor.primaryColor
                          : AppColor.blackColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
                SizedBox(
                  height: 10,
                ),
                pageIndex == 2 ?  Image.asset(
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
                            : AppColor.blackColor)),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 2
                          ? AppColor.primaryColor
                          : AppColor.blackColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 3;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                ),
                pageIndex == 3 ? Image.asset(
                  "assets/Icons/3 dots purple.png",
                  width: 25,
                  height: 25,
                ) : Image.asset(
                  "assets/Icons/3 dots.png",
                  width: 25,
                  height: 25,
                ),
                // SizedBox(height: 10,),
                Text("Menu",
                    style: TextStyle(
                        color: pageIndex == 3
                            ? AppColor.primaryColor
                            : AppColor.blackColor)),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: pageIndex == 3
                          ? AppColor.primaryColor
                          : AppColor.blackColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
