import 'package:flutter/material.dart';
import 'package:hotel_booking_mock/utilities/theme/app_theme.dart';
import 'package:hotel_booking_mock/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeView(),
    );
  }
}
