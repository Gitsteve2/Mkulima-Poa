import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
    // await ImagePicker().pickImage(source: ImageSource.gallery);
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    // var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
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

  @override
  Widget build(BuildContext context) {
    var value = probability.toStringAsFixed(2);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breed Classifier'),
      ),
      body: _loading!
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Container()
                      : Container(
                          child: Image.file(_image!),
                          height: 350,
                          width: MediaQuery.of(context).size.width - 200,
                        ),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  // _outputs != null
                  //     ? Text(
                  //         "${_outputs![0]["label"]} - ${_outputs![0]["confidence"].toStringAsFixed(2)} %",
                  //         // .replaceAll(RegExp(r'[0-9]'), ''),
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 20,
                  //             background: Paint()..color = Colors.white,
                  //             fontWeight: FontWeight.bold),
                  //       )
                  //     : Text('Classification Waiting'),
                  _outputs != null
                      ? SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${_outputs![0]["label"]} - "
                                        .replaceAll(RegExp(r'[0-9]'), ''),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        background: Paint()
                                          ..color = Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "$value%",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        background: Paint()
                                          ..color = Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : Text('Classification Waiting'),
                  _outputs != null && _outputs![0]["label"] == "0 Chihuahua"
                      ? Text("Dog is Chihuahua")
                      : _outputs != null &&
                              _outputs![0]["label"] == "4 Rottweiler"
                          ? Text("Dog is Rottweiler")
                          : Text("")
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: 'Increment',
        child: Icon(Icons.photo),
      ),
    );
  }
}
