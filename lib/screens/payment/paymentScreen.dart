import 'package:al_fifa/bloc/visa_bloc.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {Key? key, required this.visaBloc, required this.pageController})
      : super(key: key);
  final VisaBloc visaBloc;
  final PageController pageController;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
