import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mkulima_poa/cubit/app_cubit_states.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/widgets/app_text.dart';

class CameraImage extends StatelessWidget {
  File? imageFile;
  // Widget _decideImageView() {
  //   if (imageFile == null) {
  //     return Text("No Image Selected!");
  //   } else {
  //     Image.file(imageFile!, width: 400, height: 400);
  //   }
  // }

  // pickImage(BuildContext context) async {
  //   final navigator = Navigator.of(context);
  //   XFile? imageFile =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (imageFile == null) {
  //     print(imageFile!.path);
  //     await navigator.push(
  //       MaterialPageRoute(builder: (context) => detailPage()
  //           // ViewStory(
  //           //   localImagePath: pickedImage.path,
  //           // ),
  //           ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text("No Image Selected")
            // pickImage(context)
            imageFile == null
                ? Text("No Images Selected")
                : Image.file(imageFile!, width: 400, height: 400)
          ],
        ),
      ),
    );
  }

  detailPage() {
    emit(DetailState());
  }

  void emit(DetailState detailState) {}
}
