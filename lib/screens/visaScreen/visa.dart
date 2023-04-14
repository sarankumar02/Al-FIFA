import 'package:al_fifa/bloc/visa_bloc.dart';
import 'package:al_fifa/screens/payment/paymentScreen.dart';
import 'package:al_fifa/screens/travelInformation/travelInformation.dart';
import 'package:al_fifa/screens/visaScreen/visaRequest.dart';
import 'package:al_fifa/screens/visaScreen/visaScreenOne.dart';
import 'package:al_fifa/screens/visaScreen/visaScreenTwo.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/material.dart';

class Visa extends StatefulWidget {
  final bool backButton;
  const Visa({Key? key, this.backButton=true}) : super(key: key);

  @override
  State<Visa> createState() => _VisaState();
}

class _VisaState extends State<Visa> {
  //
  late VisaBloc visaBloc;

  final PageController _pageController = PageController();

  @override
  void initState() {
    visaBloc = VisaBloc();
    super.initState();
  }

  @override
  void dispose() {
    visaBloc = VisaBloc();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      VisaScreenOne(
        backButtonIcon: widget.backButton,
        visaBloc: visaBloc,
        pageController: _pageController,
      ),
      VisaScreenTwo(
        visaBloc: visaBloc,
        pageController: _pageController,
      ),
      VisaRequestScreen(
        visaBloc: visaBloc,
        pageController: _pageController,
      ),
      TravelInformation(
        visaBloc: visaBloc,
        pageController: _pageController,
      ),
      PaymentScreen(
        visaBloc: visaBloc,
        pageController: _pageController,
      )
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      body: LoaderOverlay(
        useDefaultLoading: false,
        disableBackButton: false,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        child: Container(
          padding: const EdgeInsets.only(top: 35, bottom: 10),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemBuilder: (context, position) {
              return SingleChildScrollView(child: pages[position]);
            },
            itemCount: pages.length, // Can be null
          ),
        ),
      ),
    );
  }
}
