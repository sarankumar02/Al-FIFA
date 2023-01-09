import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool payPalvalue = false;
  bool payTabvalue = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: CustomAppBar(context, "Payment Methods"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 8, left: 30, right: 20),
              child: Text(
                "Choose Payment Method",
                style: TextStyleAlFifa.text,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            checkBoxOne("PayPal.svg.png"),
            SizedBox(
              height: 10,
            ),
            checkBoxTwo("paytabs.png"),
            SizedBox(
              height: height / 2,
            ),
            CustomElevatedButton(onTap: () {}, text: "Confirm")
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
            shape: CircleBorder(),
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
            padding: EdgeInsets.only(top: 8, left: 30, right: 20),
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
            shape: CircleBorder(),
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
            padding: EdgeInsets.only(top: 8, left: 30, right: 20),
            child: Image.asset(
              "assets/Logos/$image",
              width: 100,
            ))
      ]),
    );
  }
}
