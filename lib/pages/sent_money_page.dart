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
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  final Query<Map<String, dynamic>> transCollection =
      FirebaseFirestore.instance.collection('transactions').where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid).where('qtype', isEqualTo: "sent");


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: transCollection.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        var listOfTrans = snapshot.data?.docs.map((doc) {
 
          return transModel(
            qtype: 'sent',
            type: doc.data().toString().contains('type') ? doc.get('type') : '',
            amount: doc.data().toString().contains('amount')
                ? double.parse(doc.get('amount').toString())
                : 0,
            mobile: doc.data().toString().contains('mobile')
                ? doc.get('mobile')
                : '',
            date: doc.data().toString().contains('date')
                ? doc.get('date').toString()
                : '',
            serviceName: doc.data().toString().contains('serviceName')
                ? doc.get('serviceName').toString()
                : '',
            sms: doc.data().toString().contains('sms') ? doc.get('sms') : '',
            color:
                doc.data().toString().contains('color') ? doc.get('color') : '',
            uid: this.uid ?? '',
          );
        }).toList();

        return TrasTabs(trasactions: listOfTrans);
      },
    );
  }
}
