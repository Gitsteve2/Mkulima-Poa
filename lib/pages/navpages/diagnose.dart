import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mkulima_poa/cubit/app_cubits.dart';
import 'package:mkulima_poa/disease_result/Potato_early_blight.dart';
import 'package:mkulima_poa/disease_result/apple_black_rot.dart';
import 'package:mkulima_poa/disease_result/apple_healthy.dart';
import 'package:mkulima_poa/disease_result/apple_rust.dart';
import 'package:mkulima_poa/disease_result/apple_scab.dart';
import 'package:mkulima_poa/disease_result/grape_black_measles.dart';
import 'package:mkulima_poa/disease_result/grape_black_rot.dart';
import 'package:mkulima_poa/disease_result/grape_healthy.dart';
import 'package:mkulima_poa/disease_result/grape_leaf_blight.dart';
import 'package:mkulima_poa/disease_result/maize_common_rust.dart';
import 'package:mkulima_poa/disease_result/maize_gray_leaf_spot.dart';
import 'package:mkulima_poa/disease_result/maize_healthy.dart';
import 'package:mkulima_poa/disease_result/maize_nothern_blight.dart';
import 'package:mkulima_poa/disease_result/potato_healthy.dart';
import 'package:mkulima_poa/disease_result/potato_late_blight.dart';
import 'package:mkulima_poa/disease_result/tomato_bacterial_spot.dart';
import 'package:mkulima_poa/disease_result/tomato_early_blight.dart';
import 'package:mkulima_poa/disease_result/tomato_heathy.dart';
import 'package:mkulima_poa/disease_result/tomato_late_blight.dart';
import 'package:mkulima_poa/disease_result/tomato_leaf_mold.dart';
import 'package:mkulima_poa/disease_result/tomato_mosaic_virus.dart';
import 'package:mkulima_poa/disease_result/tomato_septoria_leaf.dart';
import 'package:mkulima_poa/disease_result/tomato_target_spot.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/model/module.dart';
import 'package:mkulima_poa/pages/home_page.dart';
import 'package:mkulima_poa/pages/navpages/bar_item_page.dart';
import 'package:mkulima_poa/pages/navpages/main_page.dart';
import 'package:mkulima_poa/widgets/app_button.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';
import 'package:mkulima_poa/widgets/image.dart';
import 'package:mkulima_poa/widgets/responsive_button.dart';
import 'package:tflite/tflite.dart';

class Diagnose extends StatefulWidget {
  @override
  _DiagnoseState createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  int gottenStars = 4;
  int selectedIndex = -1;

  bool? _loading;
  File? _image;
  List? _outputs;
  double confidence = 0;
  double probability = 0;
  final _imagePicker = ImagePicker();

  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }

  pickImage() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    // Navigator.pop(context);
    classifyImage(_image!);
  }

  openCamera() async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    // Navigator.of(context).pop();
    classifyImage(_image!);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _loading = false;
      _outputs = output!;
      confidence = _outputs![0]["confidence"];
      probability = confidence * 100;
    });
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(children: [
                ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Camera"),
                    onTap: () {
                      openCamera();
                    }),
                ListTile(
                    leading: Icon(Icons.image),
                    title: Text("Gallery"),
                    onTap: () {
                      pickImage();
                    }),
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var value = probability.toStringAsFixed(2);
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            // _decideImageView(),
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/plant22.jpg"), fit: BoxFit.cover),
                ),
              ),
              // child: CameraImage(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 190,
                  height: 270,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        _image == null
                            ? Container(
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("img/plant32.jpg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.green, //color of border
                                      width: 5, //width of border
                                    ),
                                  ),
                                ),
                                height: 190,
                                width: MediaQuery.of(context).size.width - 200,
                              )
                            : SizedBox(
                                height: 200.0,
                                width: 200.0,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    _showChoiceDialog(context);
                                  },
                                  highlightElevation: 10,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: ClipRRect(
                                      child: Image.file(
                                        _image!,
                                        height: 180.0,
                                        width: 180.0,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    radius: 100,
                                  ),
                                ),
                              ),
                      ]),
                ),
              ],
            ),

            Positioned(
                top: 255,
                left: 25,
                child: Text(
                  "Let's Learn More About Plants",
                  style: TextStyle(
                      color: Colors.teal[100],
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 15),
                )),

            Positioned(
              top: 290,
              child: Container(
                // width: double.maxFinite,
                // height: double.maxFinite,
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 470,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: AssetImage("img/plant4.jpg"), fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _outputs != null
                        ? Flexible(
                            flex: 6,
                            child: Container(
                                height: 350,
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 2),
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (_outputs![0]["label"] ==
                                        "0 Leaf Scab") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            AppleScabresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "1 Black Rot") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            AppleBlackrotresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "2 Cedar Leaf Rust") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            AppleRustresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "3 Healthy") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            AppleHealthyresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "4 Gray Leaf Spot") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            MaizeGrayleafSpotresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "5 Common Rust") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            MaizeCommonrustresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "6 Healthy") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            MaizeHealthyresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "7 Northern Leaf Blight") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            MaizeNothernblightresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "8 Early Blight") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            PotatoEarlyblightresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "9 Healthy") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            PotatoHealthyresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "10 Late Blight") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            PotatoLateblightresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "11 Bacterial Spot") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TomatoBacterialSpotresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "12 Early Blight") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TomatoEarlyBlightresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "13 Healthy") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TomatoHealthyresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "14 Late Blight") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TomatoLateBlightresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "15 Leaf Mold") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TomatoLeafmoldresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "16 Septoria Leaf Spot") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TomatoSeptoriaLeafspotresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "17 Target Spot") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TomatoTargetspotresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "18 Mosaic Virus") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TomatoMosaicvirusresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "19 Black Rot") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            GrapeBlackrotresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "20 Esca (Black Measles)") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            GrapeBlackmeaslesresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "21 Healthy") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            GrapeHealthyresult(),
                                          ],
                                        ),
                                      )
                                    ] else if (_outputs![0]["label"] ==
                                        "22 Leaf Blight") ...[
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                  height: 75,
                                                  width: 310,
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 0),
                                                      color: Colors.green[600],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_outputs![0]["label"]}"
                                                                .replaceAll(
                                                                    RegExp(
                                                                        r'[0-9]'),
                                                                    ''),
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .greenAccent[
                                                                    100],
                                                                fontSize: 20,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(children: [
                                                            Text(
                                                              "Confidence: ",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              "$value%",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                          .teal[
                                                                      100],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ]),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            GrapeLeafblightresult(),
                                          ],
                                        ),
                                      )
                                    ] else ...[
                                      Container(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 35,
                                            ),
                                            Center(
                                              child: Text(
                                                "No Disease Found!",
                                                style: TextStyle(
                                                    color: Colors.green[800],
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]
                                  ],
                                )),
                          )
                        : Container(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: FloatingActionButton(
                                        onPressed: openCamera,
                                        backgroundColor: Colors.green[800],
                                        highlightElevation: 10,
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Text(
                                    "Take Photo",
                                    style: TextStyle(
                                        color: Colors.green[800],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: FloatingActionButton(
                                        onPressed: pickImage,
                                        backgroundColor: Colors.white,
                                        highlightElevation: 10,
                                        child: Icon(
                                          Icons.photo_outlined,
                                          size: 40,
                                          color: Colors.green[800],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Text(
                                    "Gallery",
                                    style: TextStyle(
                                        color: Colors.green[800],
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
