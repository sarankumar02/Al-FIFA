import 'package:al_fifa/bloc/settings_bloc.dart';
import 'package:al_fifa/models/about_us.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AboutUS extends StatefulWidget {
  const AboutUS({super.key});

  @override
  State<AboutUS> createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  late SettingsBloc settingsBloc;
  @override
  void initState() {
    settingsBloc = SettingsBloc();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            CustomAppBar(context, "About Us"),
            const SizedBox(
              height: 50,
            ),
            StreamBuilder<AboutModelResponse>(
                stream: settingsBloc.getAboutus(context: context),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image(
                          image: NetworkImage(snapshot.data!.aboutModel!.aboutus![0].bannerImage!),
                          // width: 300,
                          // height: 50,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HtmlWidget(
                          //to show HTML as widget.
                          snapshot.data!.aboutModel!.aboutus![0].content!,
                        ),
                        // Text("It all started with one small office in Dammam, Saudi Arabia in 1977. The newly established office started to gain good reputation among the booming businesses at that time. The company grew rapidly in term of business size and in number of offices covering most of the kingdom. Because of the quality of our service, with sincerity, responsibility and the integrity with which the jobs were performed, we could get a very strong footing in the field and also fastest growth in a short span of time, even beyond our expectations. This filled in us new vigour and encouragement in spreading our wings in other cities such as Riyadh, Jeddah, Hassa, Jubail, and Abha. AlFifa Services has been dedicated for Business Support Services for the more than 30 years with 14 Offices covering most of Saudi Arabia Alfifa had built an excellent reputation in the market on both fronts customers and governments and embassies. Today, AlFifa is the trusted partner for almost major businesses in the country such Saudi Aramco, SABIC, STC, DOW, Sadara and many others. At the same time, AlFifa is partnering with Saudi Government i.e. Amanah Project and more project will be announced soon. AlFifa is rated among the best Embassy Services Provider from all embassies in Riyadh and Jeddah."),
                      ],
                    ),
                  );
                  }return Container();
                })
          ],
        )),
      ),
    ));
  }
}
