import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'pages/dashboard_page.dart';
import 'pages/login_page.dart';
import 'pages/number_account_page.dart';
import 'pages/recieved_money_page.dart';
import 'pages/report_page.dart';
import 'pages/search_result_page.dart';
import 'pages/sent_money_page.dart';
import 'pages/totals_per_day_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: "/splashscreen",
      routes: [
        GoRoute(
          name: "login",
          path: "/",
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          name: "dashboard",
          path: "/dashboard",
          builder: (context, state) => DashboardPage(),
        ),
        GoRoute(
          name: "sent",
          path: "/sent_money",
          builder: (context, state) => SentMoneyPage(),
        ),
        GoRoute(
          name: "recieved",
          path: "/recieved",
          builder: (context, state) => RecievedMoneyPage(),
        ),
        GoRoute(
          name: "report",
          path: "/report",
          builder: (context, state) => ReportPage(),
        ),
        GoRoute(
          name: "number_account",
          path: "/number_account/:number",
          builder: (context, state) =>
              NumberAccountPage(number: state.params['number']!),
        ),
        GoRoute(
          name: "search_result",
          path: "/search_result",
          builder: (context, state) => SearchResultPage(),
        ),
        GoRoute(
          name: "totals_per_day",
          path: "/totals_per_day/:date",
          builder: (context, state) =>
              TotalsPerDay(date: state.params['date']!),
        ),
      ],
    );

    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
