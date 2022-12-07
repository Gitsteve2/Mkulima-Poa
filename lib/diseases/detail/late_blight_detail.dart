import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/pages/navpages/main_page.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';

class DiseaseLateblight extends StatelessWidget {
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
                          image: AssetImage("img/lateb.jpg"),
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
                              text: "Potato - Late Blight",
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
                                "Late blight is caused by the fungus Phytophthora infestans and mostly occurs later in the growing season with symptoms often not appearing until after blossom.",
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
                                "Dark brown spots develop on the leaves starting at the tip or the leaf margins. In humid climates, these spots become water-soaked lesions. A white fungal covering can be seen on the underside of the leaves. As the disease progresses, entire leaves become necrotic, turn brown and die off. Similar lesions develop on stems and petioles. The potato tubers have greyish-blue spots on their skin and their flesh also turns brown, making them inedible. The rotting of the infested fields emits a distinctive odor.",
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
                                "	Use healthy seeds or more tolerant plants. Make sure the field has good air ventilation and well-drained soil. Monitor fields and remove infected plants and surrounding ones. Use rotations of two to three years to non-host crops. Destroy volunteer hosts in and around the field. Avoid excessive fertilization with nitrogen.",
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
                                "	Apply copper-based fungicides before dry weather. Use of foliar sprays of organic coating agents can also prevent the infection. Fungicides containing mandipropamid, chlorothalonil, fluazinam, or mancozeb are used as a preventive treatment. Seed treatment before sowing with fungicides like mancozeb also work.",
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
                                  "Potato",
                                  style: TextStyle(
                                      fontSize: 17,
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
                                  "Eggplant",
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
                                  "Tomatoes",
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
