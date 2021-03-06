import 'package:app_booking_office/screen/auth/splash_screen.dart';
import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ChangeNotifierProvider(create: (_) => BookingOfficeViewModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Booking Office',
      theme: ThemeData(
        fontFamily: 'PublicSans',
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(),
    );
  }
}
