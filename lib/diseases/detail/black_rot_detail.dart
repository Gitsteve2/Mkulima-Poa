import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/pages/navpages/main_page.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';

class DiseaseBlackrot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("img/apple_blackrot.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  // child: CameraImage(),
                ),
                Positioned(
                  left: 5,
                  top: 40,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MainPage()));
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 260,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 2000,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: "Apple - Black Rot",
                              size: 24,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text:
                                "Black rot is a disease caused by the fungus, Botryosphaeria obtusa, which can attack the fruit, leaves, and bark of any tree in the pomaceous family.",
                            color: Colors.black.withOpacity(0.6)),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                            text: "Symptomps",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text:
                                "The first signs of black rot are small, purple spots appearing on the upper surfaces of leaves and enlarging into circles 1/8 to 1/4 inch in diameter.  Infected leaves develop frog-eye leaf spot. The se are circular spots with purplish or reddish edges and light tan interiors. Infected areas of branches and limbs are reddish brown and are sunken slightly below the level of surrounding healthy bark.",
                            color: Colors.black.withOpacity(0.6)),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                            text: "Precaution",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text:
                                "Maintain healthy trees and prevent tree stress. Remove the cankers by pruning at least 15 inches below the end and burn or bury them. Also take preventative care with new season prunings and burn them, too. Black rot can infect dead wood and freshly pruned wounds. Trim your trees when they are dormant, disinfect tools between cuts, and burn the branches and leaves.",
                            color: Colors.black.withOpacity(0.6)),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                            text: "Treatment",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text:
                                "Using Captan and fungicides containing a strobulurin (FRAC Group 11 Fungicides) as an active ingredient are effective controlling black rot. Prune out dead or diseased branches. Pick all dried and shriveled fruits remaining on the trees. Remove infected plant material from the area.",
                            color: Colors.black.withOpacity(0.6)),
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
                          height: 5,
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
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 300),
                                child: Text(
                                  "Pear",
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
                          margin: EdgeInsets.symmetric(vertical: 0),
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
                                  "Quince",
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
