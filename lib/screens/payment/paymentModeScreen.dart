import 'package:al_fifa/bloc/visa_bloc.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class PaymentModeScreen extends StatefulWidget {
  const PaymentModeScreen(
      {Key? key, required this.visaBloc, required this.pageController})
      : super(key: key);
  final VisaBloc visaBloc;
  final PageController pageController;

  @override
  State<PaymentModeScreen> createState() => _PaymentModeScreenState();
}

class _PaymentModeScreenState extends State<PaymentModeScreen> {
  bool payPalvalue = false;
  bool payTabvalue = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        widget.pageController.animateToPage(3,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        return false;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: CustomAppBar(context, "Payment Methods", onTap: () {
                widget.pageController.animateToPage(3,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 8, left: 30, right: 20),
              child: const Text(
                "Choose Payment Method",
                style: TextStyleAlFifa.text,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            checkBoxOne("PayPal.svg.png"),
            const SizedBox(
              height: 10,
            ),
            checkBoxTwo("paytabs.png"),
            SizedBox(
              height: height / 2,
            ),
            CustomElevatedButton(
                onTap: () {
                  print("hereeeeee in poayment");
                  widget.visaBloc.visasubmit(context: context);
                },
                text: "Confirm")
          ],
        ),
      ),
    );
  }

  Widget checkBoxOne(String image) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            shape: const CircleBorder(),
            value: this.payPalvalue,
            onChanged: (bool? value) {
              setState(() {
                this.payTabvalue = false;
                this.payPalvalue = value!;
              });
            },
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 8, left: 30, right: 20),
            child: Image.asset(
              "assets/Logos/$image",
              width: 100,
            ))
      ]),
    );
  }

  Widget checkBoxTwo(String image) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            shape: const CircleBorder(),
            value: this.payTabvalue,
            onChanged: (bool? value) {
              setState(() {
                this.payPalvalue = false;
                this.payTabvalue = value!;
              });
            },
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 8, left: 30, right: 20),
            child: Image.asset(
              "assets/Logos/$image",
              width: 100,
            ))
      ]),
    );
  }
}
