import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/pages/home_page.dart';
import 'package:mkulima_poa/pages/navpages/bar_item_page.dart';
import 'package:mkulima_poa/pages/navpages/camera_page.dart';
import 'package:mkulima_poa/pages/navpages/diagnose.dart';
import 'package:mkulima_poa/pages/navpages/search_page.dart';
import 'package:mkulima_poa/widgets/app_photo.dart';
import 'package:mkulima_poa/widgets/image.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    Diagnose(),
    LandingScreen(),
    PhotoPage()
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // Future pickImage() async {
  //   await ImagePicker().pickImage(source: ImageSource.gallery);
  // }
  File? imageFile;

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture as File?;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture as File?;
    });
    Navigator.of(context).pop();
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
                      _openCamera(context);
                    }),
                ListTile(
                    leading: Icon(Icons.image),
                    title: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    }),
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "btn1",
        label: const Text('Diagnose'),
        icon: const Icon(Icons.fit_screen),
        backgroundColor: AppColors.mainColor,
        onPressed: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => Diagnose()));
          onTap(2);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "", icon: Text('')),
          BottomNavigationBarItem(label: "", icon: Text('')),
          BottomNavigationBarItem(label: "", icon: Text('')),
          BottomNavigationBarItem(label: "", icon: Text(''))
        ],
      ),
    );
  }
}
