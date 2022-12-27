import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/trasModel.dart';
import '../app_theme.dart';

class TransCard extends StatelessWidget {
  final List<transModel> trasactions;
  const TransCard({Key? key, required this.trasactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: trasactions.map((trans) {
      return Card(
        child: Container(
          color: new Color(int.parse(trans.color)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(children: <Widget>[
                Text(
                  trans.type + ' \$' + trans.amount.toString(),
                  style: FlutterFlowTheme.of(context).subtitle1,
                ),
                Spacer(),
                Text(trans.date, style: FlutterFlowTheme.of(context).bodyText1)
              ]),
              Container(
                  width: 260,
                  padding: const EdgeInsets.all(8.0),
                  color: FlutterFlowTheme.of(context).worningBgColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Column contents vertically,
                    children: [
                      Center(
                        child: Text("Way kaakhaldantay ",
                            style: FlutterFlowTheme.of(context).bodyText1),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('iskadaa'),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                        ),
                      )
                    ],
                  )),
              Row(children: <Widget>[
                Container(
                    color: FlutterFlowTheme.of(context).smsBgColor,
                    child: Text(trans.sms,
                        style: FlutterFlowTheme.of(context).bodyText2))
              ]),
                   Row(children: <Widget>[
             ElevatedButton(
          onPressed: () {},
          child: Text('Show more'),
        )
            ]), 
            ],
          ),
        ),
      );
    }).toList());
  }
}
