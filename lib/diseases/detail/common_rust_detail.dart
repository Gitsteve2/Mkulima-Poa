import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/pages/navpages/main_page.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';

class DiseaseCommonrust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      image: AssetImage("img/plant80.jpeg"), fit: BoxFit.cover),
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
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MainPage()));
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
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
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
                          text: "Common Rust",
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
                            "Common rust produces rust-colored to dark brown, elongated pustules on both leaf surfaces. The pustules contain rust spores (urediniospores) that are cinnamon brown in color. Pustules darken as they age. Leaves, as well as sheaths, can be infected.",
                        color: AppColors.mainTextColor),
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
                            "	Rust-colored to dark brown, elongated pustules on both leaf surfaces. Pustules appear oval to elongate in shape, are generally small, less than 1/4 inch long. Pustules are surrounded by the leaf epidermal layer, where it has broken through. Stalks tend to grow weak and soft and are prone to lodging.",
                        color: AppColors.mainTextColor),
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
                            "	Plant resistant varieties available locally. Plant early to avoid optimal conditions for infection. Use shorter season varieties that mature earlier. Monitor your crop regularly for signs of the disease, even more so during overcast weather. Plan a crop rotation with non-susceptible crops.",
                        color: AppColors.mainTextColor),
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
                            "Apply a foliar fungicide early in the season if rust is bound to spread rapidly due to the weather conditions. Use of resistant maize hybrids, and by foliar applications of fungicides on sweet maize. Use of resistant varieties such as partial resistant or qualitative resistance.",
                        color: AppColors.mainTextColor),
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
                                shape: BoxShape.circle, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),
                            child: Text(
                              "Maize",
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
                              "Millet",
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
                      margin: EdgeInsets.symmetric(vertical: 0),
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
                              "Sugarcane",
                              style: TextStyle(
                                  fontSize: 17,
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
    );
  }
}
