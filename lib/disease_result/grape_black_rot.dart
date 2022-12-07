import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/pages/navpages/main_page.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';

class GrapeBlackrotresult extends StatelessWidget {
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
              "Grape black rot is a fungal disease caused by an ascomycetous fungus, Guignardia bidwellii, that attacks grape vines during hot and humid weather.",
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
              "Relatively small, brown circular lesions develop on infected leaves and within a few days tiny black spherical fruiting bodies (pycnidia) protrude from them. Elongated black lesions on the petiole may eventually girdle these organs, causing the affected leaves to wilt. Shoot infection results in large black elliptical lesions. These lesions may contribute to breakage of shoots by wind, or in severe cases, may girdle and kill young shoots altogether. This fungus bides its time. Most plants show very little signs of infection until its too late. They will look very healthy until fruit sets. Even flowering will be normal.",
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
              "Choose a planting site where the vines will be exposed to full sun and good air circulation.”[2] Proper training of grape vines should be practiced. Many people use trellising to keep the vines off the ground. Trellising is a form of plant training, which is the arrangement of plant parts spatially to optimize productivity. Having the grape vines off the ground “reduces the time that vines remain wet from dew and rain and thus limits the amount of infection. As the current seasons growth occurs, tie the new growth in a spatial manner to allow for air circulation and sunlight to affect the whole grape plant",
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
              "The first cultural control method is to choose the right grape cultivar for the region that the grape will be grown in. Grape cultivars differ in their susceptibility to diseases, including differences in the disease black rot. Some varieties are less susceptible, while others are more prone to the disease when the right environmental conditions occur. Through research, many lists of grapes varieties will show the amount of resistance a variety has to disease and how the variety should be grown. A list of grape varieties is a good place to start for selecting the right grape variety.Proper grape management in the field is important to control black rot disease. The placement of the grape plants is important to provide for proper aeration and lighting. A proper pruning technique is another cultural control method to limit diseases. Prune each vine every year during the dormant period.",
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
                    "Strawberry",
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
