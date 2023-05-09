import 'package:assesment_test/pages/dashboard_page.dart';
import 'package:assesment_test/pages/login_page.dart';
import 'package:assesment_test/pages/splash_screen.dart';
import 'package:assesment_test/provider/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Initialize SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();
  //await SharedPreferences.getInstance();

  runApp(Provider(
    create: (BuildContext context) =>DataProvider(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash Smarts',
      initialRoute: SplashScreen.route,
      routes: {
      LoginScreen.route: (context) => LoginScreen(),
      Dashboard.route: (context) => Dashboard(),
      SplashScreen.route:(context)=>SplashScreen(),
      },
    );
  }
}