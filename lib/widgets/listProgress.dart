

import 'package:ast_apps/charts/GaugeChart.dart';
import 'package:ast_apps/models/AllProgress.dart';
import 'package:flutter/material.dart';

class AllProgressList extends StatelessWidget{
  final AllProgress allProgress;

  AllProgressList({@required this.allProgress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          margin: EdgeInsets.only(top: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:EdgeInsets.fromLTRB(4, 0, 4, 2),
                child:  Column(
                    children: <Widget>[
                      Text(allProgress.progressName,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                          GaugeCharts(allProgress),
                        
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

}