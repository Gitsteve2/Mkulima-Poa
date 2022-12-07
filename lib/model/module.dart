import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';

class Module {
  Color iconBorder;
  Color iconBg;
  Color iconColor;
  IconData icon;
  String title;
  String desc;
  Color moduleBorder;
  Color moduleColor;
  String moduleBg;
  Color buttonColor;
  Color buttonFont;
  String time;

  Module(
    this.iconBorder,
    this.iconBg,
    this.iconColor,
    this.icon,
    this.title,
    this.desc,
    this.moduleBorder,
    this.moduleColor,
    this.moduleBg,
    this.buttonColor,
    this.buttonFont,
    this.time,
  );

  static List<Module> generateModules() {
    return [
      Module(
        AppColors.mainColor,
        AppColors.mainColor,
        Colors.white,
        Icons.camera,
        'STEP 1',
        'Take an Image or upload it\non the diagnose button.',
        Colors.transparent,
        Colors.grey[200]!,
        'img/plant42a.png',
        AppColors.mainColor,
        Colors.white,
        'Three',
      ),
      Module(
        AppColors.mainColor,
        AppColors.mainColor,
        Colors.white,
        Icons.filter_frames,
        'STEP 2',
        'Wait for the machine to \nlook up the disease.',
        Colors.transparent,
        Colors.grey[200]!,
        'img/plant42a.png',
        AppColors.mainColor,
        Colors.white,
        'Simple',
      ),
      Module(
        AppColors.mainColor,
        AppColors.mainColor,
        Colors.white,
        Icons.medical_services,
        'STEP 3',
        'Treat the identified \ndisease.',
        Colors.transparent,
        Colors.grey[200]!,
        'img/plant42a.png',
        AppColors.mainColor,
        Colors.white,
        ' Steps ',
      ),
    ];
  }
}
