import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/model/disease.dart';
import 'package:mkulima_poa/model/plant.dart';

class DiseaseDetail extends StatelessWidget {
  final Disease disease;
  DiseaseDetail(this.disease);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 610,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 5,
              width: 60,
              color: Colors.grey.withOpacity(0.3),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(disease.diseasePhoto))),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          disease.diseaseName,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.spa_rounded, color: AppColors.mainColor),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Plant Care & Maintenance",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(Icons.scatter_plot,
                          size: 20, color: AppColors.mainColor),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Soil: ",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        disease.diseaseName,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Poppins",
                            fontSize: 16),
                      )
                    ]),
                    Row(children: [
                      Icon(Icons.wb_sunny_sharp,
                          size: 20, color: AppColors.mainColor),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Temp: ",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        disease.diseaseName,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Poppins",
                            fontSize: 16),
                      )
                    ]),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Requirements",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                ...disease.attacked
                    .map((e) => Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 300),
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    wordSpacing: 2.5,
                                    height: 1.5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                    .toList(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  height: 45,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.mainColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: Text("Shop Now"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
