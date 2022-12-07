import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/model/disease.dart';
import 'package:mkulima_poa/model/plant.dart';

class CommonDiseaseItem extends StatelessWidget {
  final Disease disease;
  CommonDiseaseItem(this.disease);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(disease.diseasePhoto),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            disease.diseaseName,
            style: TextStyle(
                color: AppColors.textColor2,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
