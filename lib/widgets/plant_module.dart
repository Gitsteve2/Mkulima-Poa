import 'package:flutter/material.dart';
import 'package:mkulima_poa/model/module.dart';

class PlantModule extends StatelessWidget {
  final Module module;
  PlantModule(this.module);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: module.iconBorder, width: 2),
                        color: module.iconBg,
                        shape: BoxShape.circle),
                    child: Icon(
                      module.icon,
                      size: 27,
                      color: module.iconColor,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: List.generate(
                        20,
                        (index) => Expanded(
                                child: Container(
                              width: 2,
                              color: index % 2 == 0
                                  ? Colors.transparent
                                  : module.iconBorder,
                            ))),
                  ))
                ],
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: module.moduleBorder, width: 2),
                    color: module.moduleColor,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(module.moduleBg), fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          module.title,
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.8),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      module.desc,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        _buildButton(Icons.local_florist, module.time),
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  Container _buildButton(IconData icon, String text) {
    return Container(
        padding: EdgeInsets.all(5),
        width: 105,
        decoration: BoxDecoration(
            color: module.buttonColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: module.buttonFont,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                  color: module.buttonFont, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              icon,
              size: 20,
              color: module.buttonFont,
            ),
          ],
        ));
  }
}
