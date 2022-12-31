import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "dummy",
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                ),
                Container(
                  child: Image.asset(
                    "assets/Logos/Alfifa logo.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                Container(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Card(
                            elevation: 5,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image(image: AssetImage("assets/illustrations/dummy.png"),
                            width: 300,
                            height: 150,
                            fit: BoxFit.fill,)
                          ),
                          // Container(
                          //   height: 10,
                          //   width: 10,
                          //   decoration: BoxDecoration(
                          //       color: AppColor.primaryColor,
                          //       shape: BoxShape.circle),
                          // )
                        ],
                      );
                    },
                  ),
                ),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/illustrations/passport.png"),
                            width: 100,),
                          Text("Passport & \nrelated services")
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, visaScreenOne);
                      },
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/illustrations/visa.png"),
                            width: 100,),
                          Text("Visa \n ")
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/illustrations/travel packages.png"),
                            width: 100,),
                          Text("Packages Stay &\nTravel")
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                GestureDetector(
                onTap: (){},
                child: Container(
                  height: 250,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i){
                        return
                          Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Card(
                            elevation: 5,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image(image: AssetImage("assets/illustrations/dummy.png"),
                            width: 300,
                            fit: BoxFit.fill,),

                        ),
                              Container(

                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.only(left: 20,
                                    bottom: 20,top: 150),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(image: AssetImage("assets/Icons/other services.png"), width: 30,height: 30,),
                                    Text("Other Services", style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white
                                    ),),
                                    Text("International driving ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white
                                        ))
                                  ],
                                ),
                              ),
                        ]
                          );
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
