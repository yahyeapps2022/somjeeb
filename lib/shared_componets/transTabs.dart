import 'package:flutter/material.dart';
import 'package:somjeeb/shared_componets/transactionsCards.dart';
import '../app_theme.dart';
import '../models/trasModel.dart';

class TrasTabs extends StatelessWidget {
  final List<transModel>? trasactions;
  const TrasTabs({Key? key, required this.trasactions}) : super(key: key);
 
    
    

    Widget  FilterdTrans(String type){
           List<transModel?>?  data =  trasactions?.map((trans) {
                if(trans.type == type ) return trans;
              }).toList();

              return TransCard(trasactions: data);
    }
    

      @override
  Widget build(BuildContext context) {
    return  DefaultTabController( 
      initialIndex: 1,  //optional, starts from 0, select the tab by default
      length:3, 
      child:Scaffold(
          appBar: AppBar(
            title: Text("Lacagaha dirtay "),
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            bottom: TabBar(
                      tabs: [
                         Tab(text: "All",),
                          Tab(text: "EVCPlus",),
                          Tab(text: "Zaad",),
                          Tab(text: "Sahal",),
                          Tab(text: "Somnet",)
                      ]
                    ),
          ),
          
          body: TabBarView(
              children: [
                 TransCard(trasactions: trasactions),
                   FilterdTrans('EVCPlus'),
                   FilterdTrans('Zaad'),
                    FilterdTrans('Sahal'),
                     FilterdTrans('Somnet'),
              ]
          )
       )
    );
  }
 
}
