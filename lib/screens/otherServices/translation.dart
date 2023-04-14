import 'dart:io';

import 'package:al_fifa/Widgets/custom_textfield.dart';
import 'package:al_fifa/Widgets/fontstyle.dart';
import 'package:al_fifa/bloc/other_services.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:al_fifa/utils/customButton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

class Translation extends StatelessWidget {
  final OtherServicesBloc otherServicesBloc;
  final ImagePicker _picker = ImagePicker();
  final List<int> _numbers = List.generate(20, (index) => index + 1);
  Translation({super.key, required this.otherServicesBloc});
  void _showPicker(context, choice) {
    Function onTap = (selectedFilePath) {
      otherServicesBloc.changeTranslationUpload(selectedFilePath);
    };
    switch (choice) {
      case 1:
        onTap = (selectedFilePath) {
          otherServicesBloc.changeTranslationUpload(selectedFilePath);
        };
        break;

      default:
        onTap = (selectedFilePath) {
          otherServicesBloc.changeTranslationUpload(selectedFilePath);
        };
        break;
    }
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                const ListTile(
                  title: Text(
                    "",
                    style: TextStyle(
                      fontSize: 9.5,
                      fontFamily: 'CircularStd-Medium',
                    ),
                  ),
                ),
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 16.5,
                        fontFamily: 'CircularStd-Medium',
                      ),
                    ),
                    onTap: () {
                      _imgFromGallery(context, onTap: onTap);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text(
                    "Camera",
                    style: TextStyle(
                      fontSize: 16.5,
                      fontFamily: 'CircularStd-Medium',
                    ),
                  ),
                  onTap: () {
                    _imgFromCamera(onTap: onTap);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
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
    return Column(
      children: [
        Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            // margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.secondaryColor, width: 2.5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: StreamBuilder(
                stream: otherServicesBloc.paperQuantity,
                builder: (context, AsyncSnapshot snapshot1) {
                  return DropdownButtonFormField<int>(
                    value: snapshot1.data,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none),
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        "assets/Icons/drop down.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    items: _numbers.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              items.toString(),
                              style: customBRCobaneTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackColor),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: const Padding(
                      padding: EdgeInsets.only(left: 18.0, top: 8.0),
                      child: Text(
                        "IDL Quantity",
                        textAlign: TextAlign.center,
                        style: TextStyleAlFifa.normalText,
                      ),
                    ),
                    onChanged: (value) {
                      otherServicesBloc.changePaperQuantity(value);
                    },
                  );
                })),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StreamBuilder(
              stream: otherServicesBloc.translationUpload,
              builder: (context, snapshot) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    snapshot.data == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Upload document for translation\n (optional)",
                                style: TextStyleAlFifa.normalText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Allowed :JPG,JPEG,PNG,PDF",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Document uploaded successfully",
                                style: TextStyleAlFifa.normalText,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                    InkWell(
                        onTap: () {
                          _showPicker(context, 1);
                        },
                        child: Icon(Icons.upload_file_rounded))
                  ],
                );
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.content,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "Content",
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeContent,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.applicantName,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "Applicant name",
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeApplicantName,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.mobileNumber,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "Mobile number",
                  keyboardTypeNumber: true,
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeMobileNumber,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        StreamBuilder(
            stream: otherServicesBloc.email,
            builder: (context, valueMOFA) {
              return CustomTextField(
                name: "Email Id",
                errorText: (valueMOFA.error.toString() == 'null')
                    ? null
                    : valueMOFA.error.toString(),
                onchanged: otherServicesBloc.changeEmail,
              );
            }),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Image.asset(
            "assets/Icons/info purple.png",
            width: 25,
            height: 25,
          ),
          title: Text(
            "Cost will be determined after reviewing the documents.",
            style: TextStyleAlFifa.mediumText,
          ),
        ),
        StreamBuilder<bool>(
            stream: otherServicesBloc.translationValid,
            builder: (context, valueESCOT) {
              return CustomElevatedButton(
                  onTap: !valueESCOT.hasData
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text(AppConstants.pleaseFillAllFields)));
                        }
                      : () {
                          otherServicesBloc.translationSubmit(context: context);
                        },
                  text: "Submit");
            }),
      ],
    );
  }
}
