import 'package:flutter/material.dart';
import 'package:flutter_tutorial_app/representation/screens/hotel_booking_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/hotels_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/intro_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/main_app.dart';
import 'package:flutter_tutorial_app/representation/screens/rooms_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/select_date_screen.dart';
import 'package:flutter_tutorial_app/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  RoomsScreen.routeName: (context) => const RoomsScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
};