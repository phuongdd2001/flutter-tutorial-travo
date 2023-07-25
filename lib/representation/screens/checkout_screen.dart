import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/core/constants/color_constants.dart';
import 'package:flutter_tutorial_app/core/constants/dismension_constants.dart';
import 'package:flutter_tutorial_app/core/constants/textstyle_constants.dart';
import 'package:flutter_tutorial_app/core/helpers/asset_helper.dart';
import 'package:flutter_tutorial_app/core/helpers/image_helper.dart';
import 'package:flutter_tutorial_app/core/helpers/size_config.dart';
import 'package:flutter_tutorial_app/data/model/room_model.dart';
import 'package:flutter_tutorial_app/representation/screens/main_app.dart';
import 'package:flutter_tutorial_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_tutorial_app/representation/widgets/button_widget.dart';
import 'package:flutter_tutorial_app/representation/widgets/item_room_widget.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key, required this.roomModel}) : super(key: key);

  static const String routeName = '/checkout_screen';

  final RoomModel roomModel;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final List<String> steps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  Widget _buildItemOptionsCheckout(String icon, String title, String value) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(
                icon,
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Container(
            width: 180,
            //SizeConfig.screenWidth * 0.5
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            padding: EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMediumPadding),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add,
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                Text(
                  value,
                  style: TextStyles.defaultStyle.primaryTextColor.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCheckOutStep(
      int step,
      String nameStep,
      bool isEnd,
      bool isCheck,
      ) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyles.defaultStyle.copyWith(
              color: isCheck ? null : Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        Text(nameStep, style: TextStyles.defaultStyle.fontCaption.whiteTextColor),
        SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        if (!isEnd)
          SizedBox(
            width: kMinPadding,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Checkout',
      child: Column(
        children: [
          Row(
            children: steps
                .map((e) => _buildItemCheckOutStep(
                steps.indexOf(e) + 1, e, steps.indexOf(e) == steps.length - 1, steps.indexOf(e) == 0))
                .toList(),
          ),
          SizedBox(
            height: kMinPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  ItemRoomWidget(roomModel: widget.roomModel, numberOfRoom: 1),
                  _buildItemOptionsCheckout(AssetHelper.icoUser, 'Contact Details', 'Add Contact'),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  _buildItemOptionsCheckout(AssetHelper.icoPromo, 'Promo Code', 'Add Promo Code'),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  ItemButtonWidget(
                    data: 'Payment',
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.settings.name == MainApp.routeName);
                    },
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
