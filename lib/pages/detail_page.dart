import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkulima_poa/cubit/app_cubits.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/widgets/app_button.dart';
import 'package:mkulima_poa/widgets/app_large_text.dart';
import 'package:mkulima_poa/widgets/app_text.dart';
import 'package:mkulima_poa/widgets/image.dart';
import 'package:mkulima_poa/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  // Widget _decideImageView(){
  //   if(imageFile == null){
  //     return Text("No Image Selected!")
  //   } else {
  //     Image.file(imageFile, width: 400, height: 400);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            // _decideImageView(),
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/mountain.jpeg"),
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
                      BlocProvider.of<AppCubits>(context).goHome();
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
                          text: "Yosemites",
                          size: 27,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: "\$ 250",
                          size: 27,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                            text: "Kenya, Kasarani",
                            color: AppColors.textColor1)
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            );
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AppText(text: "(4.0)", color: AppColors.textColor2)
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 21),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor),
                    SizedBox(
                      height: 15,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    text: (index + 1).toString())));
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 21),
                    SizedBox(
                      height: 10,
                    ),
                    AppText(
                        text:
                            "Turn your Android phone into a mobile crop doctor: With just one photo, Mkulima Poa diagnoses infected crops and offers treatments for any pest, disease or nutrient deficiency problems.",
                        color: AppColors.mainTextColor),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: Row(
                children: [
                  AppButtons(
                    size: 55,
                    color: AppColors.textColor1,
                    borderColor: AppColors.textColor2,
                    backgroundColor: Colors.white,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ResponsiveButton(
                    isResonsive: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
