import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkulima_poa/misc/colors.dart';
import 'package:mkulima_poa/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResonsive;
  double? width;

  ResponsiveButton({Key? key, this.width = 120, this.isResonsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResonsive == true ? double.maxFinite : width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: isResonsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResonsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(text: "Book Trip Now", color: Colors.white))
                : Container(),
            Container(
                margin: const EdgeInsets.only(left: 0),
                child: Icon(
                  Icons.double_arrow_rounded,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
