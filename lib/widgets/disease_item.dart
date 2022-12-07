import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/model/disease.dart';
import 'package:mkulima_poa/model/plant.dart';

class DiseaseItem extends StatelessWidget {
  final Disease disease;
  DiseaseItem(this.disease);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 105,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(right: 15, left: 15, bottom: 12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      disease.diseaseName,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                              disease.diseasePhoto,
                            ),
                            fit: BoxFit.cover,
                          )),
                      child: Image.asset(disease.diseasePhoto),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Best planted under ",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: "Poppins",
                          fontSize: 13),
                    ),
                    Text(
                      disease.diseaseName,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: "Poppins",
                          fontSize: 13),
                    ),
                    Text(
                      " conditions",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: "Poppins",
                          fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(Icons.scatter_plot,
                          size: 17, color: AppColors.mainColor),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Soil: ",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        disease.diseaseName,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Poppins",
                            fontSize: 15),
                      )
                    ]),
                    Row(children: [
                      Icon(Icons.wb_sunny_sharp,
                          size: 17, color: AppColors.mainColor),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Temp: ",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        disease.diseaseName,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Poppins",
                            fontSize: 15),
                      )
                    ]),
                  ],
                ),
              ],
            ),
          )
        ],
      ),

      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Row(
      //           children: [
      //             Container(
      //               height: 40,
      //               width: 40,
      //               padding: EdgeInsets.all(8),
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10),
      //                   color: Colors.grey.withOpacity(0.2)),
      //               child: Image.asset(plant.plantPhoto),
      //             ),
      //             SizedBox(
      //               width: 10,
      //             ),
      //             Text(
      //               plant.plantName,
      //               style: TextStyle(
      //                   color: Colors.grey,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.bold),
      //             )
      //           ],
      //         ),
      //         Icon(
      //           Icons.bookmark_outline,
      //           color: Colors.black,
      //         )
      //       ],
      //     ),
      //     SizedBox(
      //       height: 15,
      //     ),
      //     Text(
      //       plant.plantSoil,
      //       style: TextStyle(fontWeight: FontWeight.bold),
      //     ),
      //     SizedBox(
      //       height: 15,
      //     ),
      //   ],
      // ),
    );
  }
}
