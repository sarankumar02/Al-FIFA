import 'dart:io';

import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/bloc/visa_bloc.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:al_fifa/utils/customWidgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

class TravelInformation extends StatefulWidget {
  final VisaBloc visaBloc;
  final PageController pageController;
  const TravelInformation(
      {Key? key, required this.visaBloc, required this.pageController})
      : super(key: key);

  @override
  State<TravelInformation> createState() => _TravelInformationState();
}

class _TravelInformationState extends State<TravelInformation> {
  final ImagePicker _picker = ImagePicker();
  void _showPicker(context, choice, selected) {
    Function onTap = (selectedFilePath) {
      widget.visaBloc.changeSelectedPassportUpload(selectedFilePath);
    };
    switch (choice) {
      case 1:
        onTap = (selectedFilePath) {
          widget.visaBloc.changeSelectedPassportUpload(selectedFilePath);
        };
        break;
      case 2:
        onTap = (selectedFilePath) {
          widget.visaBloc.changeSelectedPhotoUpload(selectedFilePath);
        };
        break;

      default:
        onTap = (selectedFilePath) {
          widget.visaBloc.changeSelectedPassportUpload(selectedFilePath);
        };
        break;
    }
    selected == 2
        ? _imgFromGallery(context, onTap: onTap)
        : _imgFromCamera(onTap: onTap);
  }

  checkPermissionForStorage() async {
    bool hasPermission = await permission.Permission.storage.isGranted;
    if (hasPermission) {
      return true;
    }
    await permission.Permission.storage.request();
    hasPermission = await permission.Permission.storage.isGranted;
    return hasPermission;
  }

  _imgFromCamera({Function? onTap}) async {
    bool hasPermission = await checkPermissionForCamera();
    if (!hasPermission) {
      return;
    }
    final image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      String selectedFilePath = image.path;
      onTap!(selectedFilePath);
    }
  }

  checkPermissionForCamera() async {
    bool hasPermission = await permission.Permission.camera.isGranted;
    if (hasPermission) {
      return true;
    }
    await permission.Permission.camera.request();
    hasPermission = await permission.Permission.camera.isGranted;
    return hasPermission;
  }

  _imgFromGallery(context, {Function? onTap}) async {
    bool hasPermission = await checkPermissionForStorage();
    if (!hasPermission) {
      return;
    }
    if (Platform.isIOS) {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (pickedFile == null) {
        return;
      }

      var size = await pickedFile.length();

      PlatformFile file = PlatformFile(
          path: pickedFile.path, name: pickedFile.name, size: size);

      double sizeInMb = file.size / (1024 * 1024);

      String selectedFilePath = pickedFile.path;

      if (sizeInMb < 5) {
        onTap!(selectedFilePath);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("please upload less than 5 mb")));
      }
      return;
    }
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);
    PlatformFile file = result!.files.first;

    double sizeInMb = file.size / (1024 * 1024);

    if (sizeInMb < 5) {
      // ignore: unnecessary_null_comparison
      if (result != null) {
        String selectedFilePath = result.paths[0]!;
        onTap!(selectedFilePath);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("No File selected")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("please upload less than 5 mb")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        widget.pageController.animateToPage(2,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        return false;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(context, "Travel Information", onTap: () {
                widget.pageController.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              }),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: const Text(
                        "Traveler's Information",
                        style: TextStyleAlFifa.text,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.firstName,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  name: "First Name",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged: widget.visaBloc.changeFirstName,
                                );
                              }),
                        ),
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.lastName,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  name: "Last Name",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged: widget.visaBloc.changeLastName,
                                );
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.email,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  name: "Email",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged: widget.visaBloc.changeEmail,
                                );
                              }),
                        ),
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.mobile,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  keyboardTypeNumber: true,
                                  name: "Phone Number",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged: widget.visaBloc.changeMobileNumber,
                                );
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.address1,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  name: "Address 1",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged: widget.visaBloc.changeAddress1,
                                );
                              }),
                        ),
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.address2,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  name: "Address 2",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged: widget.visaBloc.changeAddress2,
                                );
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.city,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  name: "City",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged: widget.visaBloc.changeCity,
                                );
                              }),
                        ),
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.zipCode,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  name: "Zip code",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged: widget.visaBloc.changeZipcode,
                                );
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    uploadPassport(width),
                    const SizedBox(
                      height: 20,
                    ),
                    uploadPhoto(width),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: const Text(
                        "Mother's Information",
                        style: TextStyleAlFifa.text,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.motherFirstName,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  name: "First Name",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged:
                                      widget.visaBloc.changeMotherFirstName,
                                );
                              }),
                        ),
                        SizedBox(
                          width: width * .420,
                          child: StreamBuilder(
                              stream: widget.visaBloc.motherLastName,
                              builder: (context, snapshot) {
                                return CustomTextField(
                                  name: "Last Name",
                                  errorText:
                                      (snapshot.error.toString() == 'null')
                                          ? null
                                          : snapshot.error.toString(),
                                  onchanged:
                                      widget.visaBloc.changeMotherLastName,
                                );
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<bool>(
                        stream: widget.visaBloc.visaTwoValid,
                        builder: (context, snapshot) {
                          return CustomElevatedButton(
                              onTap: snapshot.hasData
                                  ? () {
                                      widget.pageController.animateToPage(4,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                      // Navigator.pushNamed(context, paymentScreen);
                                    }
                                  : () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(AppConstants
                                                  .pleaseFillAllFields)));
                                    },
                              text: "Proceed Payment");
                        }),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget uploadPassport(double width) {
    return StreamBuilder(
        stream: widget.visaBloc.passPortUpload,
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(left: 30),
                      // height: 50,
                      // width: width/2.5,
                      child: const Text("Upload Passport")),
                  if (snapshot.data != null)
                    Container(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "File Uploaded Successfully",
                          style: TextStyleAlFifa.SucessText,
                        )),
                ],
              ),
              Container(
                  // height: 50,
                  //  width: width/2.5,
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, cameraScreen);
                          _showPicker(context, 1, 1);
                        },
                        child: Image.asset(
                          "assets/Icons/camera.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showPicker(context, 1, 2);
                        },
                        child: Image.asset("assets/Icons/photo.png",
                            width: 30, height: 30),
                      )
                    ],
                  ))
            ],
          );
        });
  }

  Widget uploadPhoto(double width) {
    return StreamBuilder(
        stream: widget.visaBloc.photoUpload,
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 30),
                      alignment: Alignment.center,
                      child: const Text("Upload Photo")),
                  if (snapshot.data != null)
                    Container(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "File Uploaded Successfully",
                          style: TextStyleAlFifa.SucessText,
                        )),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showPicker(context, 2, 1);
                        },
                        child: Image.asset(
                          "assets/Icons/camera.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showPicker(context, 2, 2);
                        },
                        child: Image.asset("assets/Icons/photo.png",
                            width: 30, height: 30),
                      )
                    ],
                  ))
            ],
          );
        });
  }
}
