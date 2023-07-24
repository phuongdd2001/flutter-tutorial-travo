import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/core/constants/dismension_constants.dart';
import 'package:flutter_tutorial_app/core/helpers/asset_helper.dart';
import 'package:flutter_tutorial_app/representation/widgets/item_add_guest_and_room.dart';
import 'package:flutter_tutorial_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_tutorial_app/representation/widgets/button_widget.dart';

class GuestAddRoomBookingScreen extends StatefulWidget {
  const GuestAddRoomBookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/guest_add_room_screen';

  @override
  State<GuestAddRoomBookingScreen> createState() =>
      _GuestAddRoomBookingScreenState();
}

class _GuestAddRoomBookingScreenState extends State<GuestAddRoomBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Add Guest Add Room',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 1.5,
          ),
          ItemAddGuestAndRoom(
            icon: AssetHelper.icoGuest,
            initData: 2,
            title: 'Guest',
          ),
          ItemAddGuestAndRoom(
            icon: AssetHelper.icoRoom,
            initData: 1,
            title: 'Room',
          ),
          ItemButtonWidget(
            data: 'Select',
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: kDefaultPadding),
          ItemButtonWidget(
              data: 'Cancel',
              onTap: (){
                Navigator.of(context).pop();
              }
          ),
        ],
      ),
    );
  }
}
