import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/pages/navpages/main_page.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';

class DiseaseApplerust extends StatelessWidget {
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
                          image: AssetImage("img/apple_rust.jpg"),
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
                              text: "Apple Rust",
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
                                "Cedar apple rust (Gymnosporangium juniperi-virginianae) is a fungal disease that depends on two species to spread and develop.",
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
                                "Leaf spots are first yellow then turn bright orange-red, often with a bright red border. Small, raised, black dots form in the center of leaf spots on the upper leaf surface when the leaf spots mature. Very short (less than 1/10th inch), finger-like fungal tubes stick out from the lower surface of the leaf, directly below leaf spots. Small finger-like fungal tubes from cedar apple rust sticking out from the lower surface of the leaf. The fungal tubes appear fringed when they open at the tip to release yellow to orange, powdery spores.",
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
                                "Removing either host from the vicinity of the other. Removing all cedar-apple rust galls by pruning them out of the cedar trees in order to break the disease cycle. Following a fungicide spray schedule starting at blossom time and continuing at seven-day intervals until the cedar galls have stopped spreading spores.",
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
                                "Use of fungisides that inhibit fungal sterols. Treatment using a solution of copper at least four times. Use 0.5 to 2.0 ounces of copper per gallon of water.",
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
                                  "Apple",
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
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 300),
                                child: Text(
                                  "Serviceberry",
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
                                  "Hawthorn",
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
