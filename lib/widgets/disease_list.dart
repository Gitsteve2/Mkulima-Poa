import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkulima_poa/cubit/app_cubits.dart';
import 'package:mkulima_poa/diseases/detail/apple_rust_detail.dart';
import 'package:mkulima_poa/diseases/detail/apple_scab_detail.dart';
import 'package:mkulima_poa/diseases/detail/black_measles_detail.dart';
import 'package:mkulima_poa/diseases/detail/black_rot_detail.dart';
import 'package:mkulima_poa/diseases/detail/common_rust_detail.dart';
import 'package:mkulima_poa/diseases/detail/early_blight_detail.dart';
import 'package:mkulima_poa/diseases/detail/late_blight_detail.dart';
import 'package:mkulima_poa/diseases/detail/leaf_blight_detail.dart';
import 'package:mkulima_poa/diseases/list/apple_rust_list.dart';
import 'package:mkulima_poa/diseases/list/apple_scab_list.dart';
import 'package:mkulima_poa/diseases/list/black_measles_list.dart';
import 'package:mkulima_poa/diseases/list/black_rot_list.dart';
import 'package:mkulima_poa/diseases/list/common_rust_list.dart';
import 'package:mkulima_poa/diseases/list/early_blight_list.dart';
import 'package:mkulima_poa/diseases/list/late_blight_list.dart';
import 'package:mkulima_poa/diseases/list/leaf_blight_list.dart';
import 'package:mkulima_poa/model/disease.dart';

class DiseaseList extends StatelessWidget {
  final diseaseList = Disease.generateDiseases();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15, top: 15),
      height: 250,
      width: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 7),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DiseaseEarlyblight()));
              },
              child: Row(
                children: [
                  EarlyBlightList(),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 7),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DiseaseLateblight()));
              },
              child: Row(
                children: [
                  LateBlightList(),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 7),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DiseaseBlackrot()));
              },
              child: Row(
                children: [
                  BlackRotList(),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 7),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DiseaseApplerust()));
              },
              child: Row(
                children: [
                  AppleRustList(),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 7),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DiseaseBlackmeasles()));
              },
              child: Row(
                children: [
                  BlackMeaslesList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
