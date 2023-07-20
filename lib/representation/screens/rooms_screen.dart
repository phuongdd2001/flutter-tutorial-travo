import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial_app/core/helpers/asset_helper.dart';
import 'package:flutter_tutorial_app/data/model/room_model.dart';
import 'package:flutter_tutorial_app/representation/screens/check_out_screen.dart';
import 'package:flutter_tutorial_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_tutorial_app/representation/widgets/item_room_widget.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  static const String routeName = '/rooms_screen';

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
        roomImage: AssetHelper.room1,
        roomName: 'Deluxe Room',
        utility: 'Free Cancellation',
        size: 27,
        price: 245),
    RoomModel(
        roomImage: AssetHelper.room2,
        roomName: 'Executive Suite',
        utility: 'Non-refundable',
        size: 32,
        price: 289),
    RoomModel(
        roomImage: AssetHelper.room3,
        roomName: 'King Bed Only Room',
        utility: 'Non-refundable',
        size: 24,
        price: 214),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select room',
      child: SingleChildScrollView(
        child: Column(
          children: listRoom.map((e) => ItemRoomWidget(
            roomModel: e,
            onTap: () {
              Navigator.of(context).pushNamed(CheckOutScreen.routeName, arguments: e);
            },
          ),
          ).toList(),
        ),
      ),
    );
  }
}
