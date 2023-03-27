import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutUS extends StatefulWidget {
  const AboutUS({super.key});

  @override
  State<AboutUS> createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomAppBar(context, "About Us"),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: const [
                SizedBox(height: 20,),
                Image(
                  image: AssetImage("assets/Images/Clip.png"),
                  // width: 300,
                  // height: 50,
                  fit: BoxFit.fill,
                ),
                   SizedBox(height: 20,),
                Text("It all started with one small office in Dammam, Saudi Arabia in 1977. The newly established office started to gain good reputation among the booming businesses at that time. The company grew rapidly in term of business size and in number of offices covering most of the kingdom. Because of the quality of our service, with sincerity, responsibility and the integrity with which the jobs were performed, we could get a very strong footing in the field and also fastest growth in a short span of time, even beyond our expectations. This filled in us new vigour and encouragement in spreading our wings in other cities such as Riyadh, Jeddah, Hassa, Jubail, and Abha. AlFifa Services has been dedicated for Business Support Services for the more than 30 years with 14 Offices covering most of Saudi Arabia Alfifa had built an excellent reputation in the market on both fronts customers and governments and embassies. Today, AlFifa is the trusted partner for almost major businesses in the country such Saudi Aramco, SABIC, STC, DOW, Sadara and many others. At the same time, AlFifa is partnering with Saudi Government i.e. Amanah Project and more project will be announced soon. AlFifa is rated among the best Embassy Services Provider from all embassies in Riyadh and Jeddah."),
              ],
            ),
          )
        ],
      )),
    ));
  }
}
