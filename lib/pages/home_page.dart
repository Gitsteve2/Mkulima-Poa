import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkulima_poa/cubit/app_cubits.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/model/disease.dart';
import 'package:mkulima_poa/model/module.dart';
import 'package:mkulima_poa/pages/disease_detail.dart';
import 'package:mkulima_poa/pages/plant_detail.dart';
import 'package:mkulima_poa/pages/plant_detail.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';
import 'package:mkulima_poa/widgets/common_disease_list.dart';
import 'package:mkulima_poa/widgets/disease_list.dart';
import 'package:mkulima_poa/widgets/plant_instructions.dart';
import 'package:mkulima_poa/widgets/plant_list.dart';
import 'package:mkulima_poa/widgets/plant_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "plant80.jpeg": "Early Blight",
    "plant83.png": "Leaf Mold",
    "plant84.jpg": "Black Rot",
    "lateb.jpg": "Late Blight"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 15),
            child: Row(
              children: [
                // Icon(Icons.menu, size: 30, color: Colors.black54),

                Container(
                  margin: const EdgeInsets.only(right: 15),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("img/plant11.jpg"),
                        fit: BoxFit.cover),
                    border: Border.all(
                      color: Colors.green, //color of border
                      width: 2, //width of border
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: AppLargeText(
                    text: "Mkulima",
                    size: 28,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 25),
                  child: AppText(
                    text: "POA",
                    size: 28,
                    color: Color(0xFF388E3C),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: AppLargeText(text: "Discover more"),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 15, right: 15),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                // indicatorColor: Colors.green,
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(text: "App Guide"),
                  Tab(text: "Diseases"),
                  Tab(text: "Crops")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            height: 270,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                PlantInstructions(),
                DiseaseList(),
                PlantList(),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Common Diseases", size: 18),
                // AppText(text: "See all", color: AppColors.textColor1)
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          CommonDiseaseList(),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
