import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/pages/navpages/main_page.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';

class GrapeBlackmeaslesresult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: Text(
              "Description",
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            child: Text(
              "Apple scab, caused by the fungus Venturia inaequalis, is a serious fungal disease of apple in Ontario infecting foliage, blossoms and fruits.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Text(
              "Symptomps",
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            child: Text(
              "Leaf spots are round, olive-green in color and up to ½-inch across. Spots are velvet-like with fringed borders.As they age, leaf spots turn dark brown to black, get bigger and grow together.Leaf spots often form along the leaf veins.Leaves with many leaf spots turn yellow and drop by mid-summer.Infected fruit have olive-green spots that turn brown and corky with time.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Text(
              "Precaution",
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            child: Text(
              "Choose resistant varieties when possible.Cleaning leaf litter from the base of previously-infected trees, as well as removing infected woody material from the canopy when performing annual pruning.Monitoring watering periods and avoid using overhead watering systems. Doing so may ultimately aid in reducing infection periods caused by natural precipitation.Water in the evening or early morning hours (avoid overhead irrigation) to give the leaves time to dry out before infection can occur.Spread a 3- to 6-inch layer of compost under trees, keeping it away from the trunk, to cover soil and prevent splash dispersal of the fungal spores.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Text(
              "Treatment",
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            child: Text(
              "Remove and destroy the fallen leaf litter so that the fungus cannot overwinter. This may reduce the disease pressure in the following spring, but will not likely eliminate the disease.Do not overcrowd plants, and make sure the canopy has proper airflow. This will decrease the conditions favorable for disease development.Fungicide applications at 2-week intervals beginning when new growth is expanding in the spring.Rake under trees and destroy infected leaves to reduce the number of fungal spores available to start the disease cycle over again next spring.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Text(
              "Crops Attacked",
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                ),
                SizedBox(
                  width: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Text(
                    "Plams",
                    style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                ),
                SizedBox(
                  width: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Text(
                    "Grapes",
                    style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
