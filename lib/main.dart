import 'package:flutter/material.dart';
import 'package:googleads/home_view_googleads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}