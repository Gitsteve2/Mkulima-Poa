import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkulima_poa/cubit/app_cubits.dart';
import 'package:mkulima_poa/diseases/detail/early_blight_detail.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/model/disease.dart';
import 'package:mkulima_poa/model/plant.dart';
import 'package:mkulima_poa/pages/common_disease_detail.dart';
import 'package:mkulima_poa/pages/disease_detail.dart';
import 'package:mkulima_poa/pages/plant_detail.dart';
import 'package:mkulima_poa/widgets/app_text.dart';
import 'package:mkulima_poa/widgets/common_disease_item.dart';
import 'package:mkulima_poa/widgets/disease_item.dart';
import 'package:mkulima_poa/widgets/plant_item.dart';

class CommonDiseaseList extends StatelessWidget {
  final diseaseList = Disease.generateDiseases();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15),
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  final diseaseList = Disease.generateDiseases();
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) =>
                          CommonDiseaseDetail(diseaseList[index]));
                },
                child: CommonDiseaseItem(diseaseList[index]),
              ),
            );
          }),
    );
  }
}
