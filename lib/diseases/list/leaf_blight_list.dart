import 'package:flutter/material.dart';

class LeafBlightList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15, top: 15),
      height: 280,
      width: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("img/mountain.jpeg"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Disease One",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: "Poppins",
                      fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
