import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/model/plant.dart';
import 'package:mkulima_poa/pages/plant_detail.dart';
import 'package:mkulima_poa/widgets/plant_item.dart';

class PlantList extends StatelessWidget {
  final plantList = Plant.generatePlants();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 15, top: 15),
        height: 250,
        width: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("img/plant48.jpg"), fit: BoxFit.cover)),
        child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => PlantDetail(plantList[index]));
              },
              child: PlantItem(plantList[index])),
          separatorBuilder: (_, index) => SizedBox(
            width: 15,
          ),
          itemCount: plantList.length,
        ));
  }
}
