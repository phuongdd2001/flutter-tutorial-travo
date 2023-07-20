import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial_app/core/constants/color_constants.dart';
import 'package:flutter_tutorial_app/core/constants/dismension_constants.dart';
import 'package:flutter_tutorial_app/core/constants/textstyle_constants.dart';

class ItemButtonWidget extends StatelessWidget {
  const ItemButtonWidget({Key? key, required this.data, this.onTap, this.color})
      : super(key: key);

  final String data;
  final Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          style: color == null
              ? TextStyles.defaultStyle.whiteTextColor.bold
              : TextStyles.defaultStyle.bold
                  .copyWith(color: ColorPalette.primaryColor),
        ),
      ),
    );
  }
}
