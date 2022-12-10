import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somjeeb/services/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  Text(
                    'Sign in to TGD and continue',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    elevation: 0,
                    minWidth: double.maxFinite,
                    height: 50,
                    onPressed: AuthService().signInWithGoogle,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.google),
                        SizedBox(width: 10),
                        Text('Sign-in with Google',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    textColor: Colors.white,
                  ),

                  ElevatedButton(
                      onPressed: _launchURL,
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0, shadowColor: Colors.transparent),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 10),
                            Text('built by yahyeapps.com',
                                textAlign: TextAlign.center)
                          ]))

                  // coppyright button
                ]))));
  }

  _launchURL() async {
    final Uri url = Uri(scheme: 'https', host: 'yahyeapps.com');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
