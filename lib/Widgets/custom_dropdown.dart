import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CustomDropDown extends StatefulWidget {
  final Function onTap;
  final String name;

  CustomDropDown(
      {Key? key, required this.onTap,  required this.name})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late SettingsBloc settingsBloc;

  @override
  Widget build(BuildContext context) {
    settingsBloc = Provider.of<SettingsBloc>(context);

    return StreamBuilder(
        stream: settingsBloc.appTheme,
        builder: (context, AsyncSnapshot<ThemeData> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  widget.onTap();
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                       
                        width: 1.0),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              textAlign: TextAlign.center,
                              style: customBRCobaneTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                 ),
                            ),
                          ],
                        ),
                        const RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                           
                          ),
                        )
                      ]),
                ),
              ),
            ],
          );
        });
  }
}
