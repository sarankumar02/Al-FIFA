import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
   ScreenOne({Key? key, required String  this.text}) : super(key: key);
   String text;

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    text = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text),
      ),
    );
  }
}
