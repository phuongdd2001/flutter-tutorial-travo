import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial_app/core/constants/dismension_constants.dart';
import 'package:flutter_tutorial_app/core/extensions/date_ext.dart';
import 'package:flutter_tutorial_app/core/helpers/asset_helper.dart';
import 'package:flutter_tutorial_app/representation/screens/select_date_screen.dart';
import 'package:flutter_tutorial_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_tutorial_app/representation/widgets/button_widget.dart';
import 'package:flutter_tutorial_app/representation/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';
  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? selectDate;
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Hotel booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoLocation,
              title: 'Destination',
              description: 'Korea',
              onTap: () {},
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return ItemBookingWidget(
                  icon: AssetHelper.icoCalendal,
                  title: 'Select date',
                  description: selectDate ?? '12 agn',
                  onTap: () async {
                    final result = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                    if (result is List<DateTime?>) {
                      setState(() {
                        selectDate = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                      });
                    }
                  },
                );
              },
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoBed,
              title: 'Guest and room',
              description: '2 Guest in room',
              onTap: () {},
            ),
            ItemButtonWidget(
              data: 'Search',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
