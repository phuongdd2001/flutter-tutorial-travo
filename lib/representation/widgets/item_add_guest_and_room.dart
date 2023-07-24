import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/core/constants/dismension_constants.dart';
import 'package:flutter_tutorial_app/core/helpers/asset_helper.dart';
import 'package:flutter_tutorial_app/core/helpers/image_helper.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  const ItemAddGuestAndRoom({Key? key, this.initData = 0, required this.icon, required this.title}) : super(key: key);

  final String title;
  final String icon;
  final int initData;

  @override
  State<ItemAddGuestAndRoom> createState() => _ItemAddGuestAndRoomState();
}

class _ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {

  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();

  late int number;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initData.toString())
      ..addListener(() {
        number = int.parse(_textEditingController.text);
      });
    number = widget.initData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kTopPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: EdgeInsets.all(
        kMediumPadding
      ),
      child: Row(
        children: [
          ImageHelper.loadFromAsset(AssetHelper.icoGuest),
          SizedBox(width: kDefaultPadding),
          Text(widget.title),
          Spacer(),
          GestureDetector(
            onTap: () {
              if(number > 1) {
                setState(() {
                  number--;
                  _textEditingController.text = number.toString();
                  if(_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                });
              }
            },
            child: ImageHelper.loadFromAsset(AssetHelper.icoDecre),
          ),
          Container(
            height: 35,
            width: 60,
            padding: EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  bottom: 18,
                ),
              ),
              onChanged: (value) {},
              onSubmitted: (String submitValue) {},
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
                _textEditingController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              });
            },
            child: ImageHelper.loadFromAsset(AssetHelper.icoIncre),
          )
        ],
      ),
    );
  }
}
