import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../shared_componets/transTabs.dart';
import '../models/trasModel.dart';

class SentMoneyPage extends StatefulWidget {
  @override
  _SentMoneyPageState createState() => _SentMoneyPageState();
}

class _SentMoneyPageState extends State<SentMoneyPage> {
  final CollectionReference transCollection =
      FirebaseFirestore.instance.collection('transactions');

  final String? uid = FirebaseAuth.instance.currentUser?.uid;
 

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: transCollection.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

      var  listOfTrans = snapshot.data?.docs.map((doc) {
      //print(doc.data);
      return transModel(
        type: doc.get('type') ?? '',
        amount: doc.get('amount') ?? 0,
        mobile: doc.get('mobile') ?? '',
        date: doc.get('date') ?? '',
        serviceName: doc.get('serviceName') ?? '',
        sms: doc.get('sms') ?? '',
        color: doc.get('color') ?? '',
        uid: this.uid ?? '',
      );
    }).toList();
 
        return TrasTabs(trasactions: listOfTrans );
      },
    );
  }
}
