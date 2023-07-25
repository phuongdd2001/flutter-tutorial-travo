import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/data/model/hotel_model.dart';
import 'package:flutter_tutorial_app/data/model/room_model.dart';
import 'package:flutter_tutorial_app/representation/screens/checkout_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/detail_hotel_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/hotel_booking_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/hotels_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/intro_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/main_app.dart';
import 'package:flutter_tutorial_app/representation/screens/rooms_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/select_date_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/select_room_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  IntroScreen.routeName: (context) => IntroScreen(),
  MainApp.routeName: (context) => MainApp(),
  HotelsScreen.routeName: (context) => HotelsScreen(),
  RoomsScreen.routeName: (context) => RoomsScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAddRoomBookingScreen.routeName: (context) => GuestAddRoomBookingScreen(),
  SelectRoomScreen.routeName: (context) => SelectRoomScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DetailHotelScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => DetailHotelScreen(
          hotelModel: hotelModel,
        ),
      );
    case CheckOutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination,
        ),
      );
    default:
      return null;
  }
}
