import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/pages/navpages/main_page.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';

class TomatoSeptoriaLeafspotresult extends StatelessWidget {
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
              "Septoria leaf spot is caused by a fungus, Septoria lycopersici and is one of the most destructive diseases of tomato foliage.",
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
              "Septoria leaf spot first appears on the lower/older leaves. The disease then spreads upwards from the oldest to the youngest growth.The spots are circular, with dark brown margins and tan to gray centers with small black fruiting structures. Characteristically, there are many spots per leaf.In the center of the spots are many dark brown, pimple-like structures called pycnidia-fruiting bodies of the fungus. These structures are large enough to be seen with the unaided eye or with the aid of a hand lens.Spots may also appear on stems, calyxes, and blossoms, but rarely on fruit.",
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
              "Avoid overhead irrigation because it facilitates infection and spreads the disease. Control weeds, especially those in the same family with tomato like Nightshades Crop rotations with non-hosts Plant tomatoes in a raised bed to improve drainage and prevent diseases from spreading",
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
              "Removing infected leaves. Remove infected leaves immediately, and be sure to wash your hands and pruners thoroughly before working with uninfected plants.Consider organic fungicide options. Fungicides containing either copper or potassium bicarbonate will help prevent the spreading of the disease. Begin spraying as soon as the first symptoms appear and follow the label directions for continued management.Consider chemical fungicides. While chemical options are not ideal, they may be the only option for controlling advanced infections. One of the least toxic and most effective is chlorothalonil (sold under the names Fungonil and Daconil).",
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
                    "Wheat",
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
                    "Potato",
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
