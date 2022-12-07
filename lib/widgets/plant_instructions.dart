import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/model/module.dart';
import 'package:mkulima_poa/widgets/plant_module.dart';

class PlantInstructions extends StatelessWidget {
  final modulesList = Module.generateModules();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...modulesList.map((e) => PlantModule(e)).toList(),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.mainColor, width: 2),
                              color: AppColors.mainColor,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.grass_outlined,
                            size: 27,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.mainColor, width: 2),
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sentiment_very_satisfied_outlined,
                                size: 28,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'HEALTHY PLANT',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
