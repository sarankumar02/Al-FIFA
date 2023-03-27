import 'package:al_fifa/bloc/profile_bloc.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late UserDetailsBloc profileBloc;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController mobile = TextEditingController();
  String userEmail = "";
  // TextEditingController firstname = TextEditingController();
  late Map res;
  userEmailidsync() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userEmailId = _prefs.getString("userEmailId");
    userEmail = userEmailId.toString();
    res = {"email": userEmail};
    return userEmailId;
  }

  @override
  void initState() {
    userEmailidsync();

    // firstName=TextEditingController(text:user!.userDetailsModel!.message );
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () async {
      profileBloc.getUserProfile(
          body: res, context: context, valueUpdater: valueUpdater);
    });
  }

  valueUpdater({firstName, lastName, email, contactNumber}) {
    print("shsh" + email + firstname.text + " mfm");
    firstname.text = firstName;
    lastname.text = lastName;

    emailAddress.text = email;
    mobile.text = contactNumber;
  }

  @override
  Widget build(BuildContext context) {
    profileBloc = Provider.of<UserDetailsBloc>(context);
    return Scaffold(
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
                height: 40,
              ),
              CustomAppBar(context, "My Profile"),
              Container(
                child: Image.asset(
                  "assets/Logos/Alfifa logo.png",
                  width: 120,
                  height: 120,
                ),
              ),
              MyProfileTextField()
            ],
          ),
        ),
      ),
    );
  }

  Widget MyProfileTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
      child: Column(
        children: [
          StreamBuilder(
              stream: profileBloc.firstName,
              builder: (context, snapshot) {
                return customTextField2(
                    firstname,
                    "first name",
                    (snapshot.error.toString() == 'null')
                        ? null
                        : snapshot.error.toString(),
                    profileBloc.changeFirstName);
              }),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: profileBloc.lastName,
              builder: (context, snapshot) {
                return customTextField2(
                    lastname,
                    "last name",
                    (snapshot.error.toString() == 'null')
                        ? null
                        : snapshot.error.toString(),
                    profileBloc.changeLastName);
              }),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: profileBloc.contactNumber,
              builder: (context, snapshot) {
                return customTextField2(
                    mobile,
                    "Mobile number",
                    (snapshot.error.toString() == 'null')
                        ? null
                        : snapshot.error.toString(),
                    profileBloc.changeContactNumber);
              }),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: profileBloc.email,
              builder: (context, snapshot) {
                return customTextField2(
                    emailAddress,
                    "Email address",
                    (snapshot.error.toString() == 'null')
                        ? null
                        : snapshot.error.toString(),
                    profileBloc.changeEmail);
              }),
          const SizedBox(
            height: 40,
          ),
          CustomElevatedButton(
              onTap: () async {
                Map body = {
                  "firstname": firstname.text,
                  "lastname": lastname.text,
                  "mobile": mobile.text,
                  "email": emailAddress.text,
                  "update": "yes"
                };
                await profileBloc.updateUserDetails(
                    body: body, context: context);
              },
              text: "Save"),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
