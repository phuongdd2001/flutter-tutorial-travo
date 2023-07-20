
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/core/constants/color_constants.dart';
import 'package:flutter_tutorial_app/core/constants/dismension_constants.dart';
import 'package:flutter_tutorial_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_tutorial_app/representation/widgets/button_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class SelectDateScreen extends StatelessWidget {

  SelectDateScreen({Key? key}) : super(key: key);

  static const String routeName = '/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        child: Column(
          children: [
            SizedBox(height: kMediumPadding),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: ColorPalette.yellowColor,
              startRangeSelectionColor: ColorPalette.yellowColor,
              endRangeSelectionColor: ColorPalette.yellowColor,
              rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
              todayHighlightColor: ColorPalette.yellowColor,
              toggleDaySelection: true,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                } else {
                  rangeStartDate = null;
                  rangeEndDate = null;
                }
              },
            ),
            ItemButtonWidget(
                data: 'Select',
              onTap: (){
                  Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              },
            ),
            SizedBox(height: kDefaultPadding),
            ItemButtonWidget(
                data: 'Cancel',
                onTap: (){
                  Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
                }
            )
          ],
        ),
    );
  }
}
