import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/core/constants/dismension_constants.dart';
import 'package:flutter_tutorial_app/core/constants/textstyle_constants.dart';
import 'package:flutter_tutorial_app/core/helpers/asset_helper.dart';
import 'package:flutter_tutorial_app/core/helpers/image_helper.dart';
import 'package:flutter_tutorial_app/representation/screens/main_app.dart';
import 'package:flutter_tutorial_app/representation/widgets/button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static const routeName = 'intro_screen';
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemIntroScreen(String image, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: ImageHelper.loadFromAsset(image,
              height: 375, fit: BoxFit.fitHeight),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kMediumPadding,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            _buildItemIntroScreen(
                AssetHelper.slide1, 'Book a flight 1', 'Book a flight'),
            _buildItemIntroScreen(
                AssetHelper.slide2, 'Book a flight 2', 'Book a flight'),
            _buildItemIntroScreen(
                AssetHelper.slide3, 'Book a flight 3', 'Book a flight'),
          ],
        ),
        Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 2,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange,
                    ),
                  ),
                ),
                StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                          flex: 4,
                          child: ItemButtonWidget(
                            data: snapshot.data != 2 ? 'Next' : 'Get started',
                            onTap: () {
                              if (_pageController.page != 2) {
                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              } else {
                                Navigator.of(context)
                                    .pushNamed(MainApp.routeName);
                              }
                            },
                          ));
                    }),
              ],
            ))
      ],
    ));
  }
}
