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
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
       name: "login",  path: "/",
      builder: (context, state) =>  LoginPage(),
    ),
    GoRoute(
       name: "dashboard", path: "/dashboard",
      builder: (context, state) => const DashboardPage(),
    ),
     GoRoute(
       name: "sent", path: "/sent_money",
      builder: (context, state) => const SentMoneyPage(),
    ),
   GoRoute(
       name: "recieved", path: "/recieved",
      builder: (context, state) => const RecievedMoneyPage(),
    ),   

     GoRoute(
       name: "report", path: "/report",
      builder: (context, state) => const ReportPage(),
    ), 
    GoRoute(
       name: "number_account", path: "/number_account/:number",
      builder: (context, state) => const NumberAccountPage(number:state.params['number']!),
    ), 
   GoRoute(
       name: "search_result", path: "/search_result",
      builder: (context, state) => const SearchResultPage(),
    ), 
  GoRoute(
       name: "totals_per_day", path: "/totals_per_day/:date",
      builder: (context, state) => const TotalsPerDay(date:state.params['date']!),
    ), 

  ],
);


    return MaterialApp.router(
  routerConfig: _router,
  title: "somjeeb",
);

  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Navigation over screens'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              // Navigate using declared route name
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/second'),
                child: Text('Navigate using routes'),
              ),
              // Navigate using simple push method
              ElevatedButton(
                onPressed: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    ),
                child: Text('Navigate using push method'),
              )
            ],
          ),
        ),
      );
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Back'),
        ),
      ),
    );
  }
}
