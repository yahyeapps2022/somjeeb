import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:somjeeb/pages/login_page.dart';
import 'package:somjeeb/pages/dashboard_page.dart';
import 'package:somjeeb/pages/number_account_page.dart';
import 'package:somjeeb/pages/recieved_money_page.dart';
import 'package:somjeeb/pages/report_page.dart';
import 'package:somjeeb/pages/search_result_page.dart';
import 'package:somjeeb/pages/sent_money_page.dart';
import 'package:somjeeb/pages/splash_screen_page.dart';
import 'package:somjeeb/pages/totals_per_day_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const Dashboard(),
                '/login': (context) => LoginPage(),
              },
            );
          } else {
            return LoginPage();
          }
        });
  }
}
