import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/core/constants/dismension_constants.dart';
import 'package:flutter_tutorial_app/core/constants/textstyle_constants.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      this.onTap})
      : super(key: key);

  final String icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kTopPadding)),
        ),
        margin: EdgeInsets.only(bottom: kMediumPadding),
        child: Row(
          children: [
            Image.asset(
              icon,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.defaultStyle.fontCaption,
                ),
                SizedBox(
                  height: kMinPadding,
                ),
                Text(description,
                    style: TextStyles.defaultStyle.bold),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
