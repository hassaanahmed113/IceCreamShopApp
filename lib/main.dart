import 'package:IceCreamShopApp/payments/keys.dart';
import 'package:flutter/material.dart';
import 'package:IceCreamShopApp/HomeScreen.dart';
import 'package:IceCreamShopApp/TextScreen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'LoginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = Keys.publishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: IceCreamShopApp(),
    );
  }
}
