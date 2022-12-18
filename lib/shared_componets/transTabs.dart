import 'package:flutter/material.dart';
import '../models/trasModel.dart';

class TrasTabs extends StatelessWidget {
  final List<transModel>? trasactions;
  const TrasTabs({Key? key, required this.trasactions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             for(var trans in trasactions! ) Text(trans.sms)
          ],
        ),  
    );
  }
}
