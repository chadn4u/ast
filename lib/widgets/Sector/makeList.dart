

import 'package:ast_apps/models/SectorModel.dart';
import 'package:flutter/material.dart';

class MakeListSector extends StatelessWidget{
  final SectorModel sectorModel;

  MakeListSector({this.sectorModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1,
              color: Colors.blueAccent
            )
          )
        ),
        child: Text(sectorModel.sector,style: TextStyle(fontSize: 35),),
      ),
      title: Align(
        alignment: Alignment.center,
        child: Text(sectorModel.sectorName,style: TextStyle(fontWeight: FontWeight.bold),)),
      subtitle: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(sectorModel.area,)
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(sectorModel.pic,)
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.only(right: 10),
                child: Text(sectorModel.lock1.toString()),
                decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 1,
                        color: Colors.blueAccent
                      )
                    )
                ),
              ),
              Text(sectorModel.lock3.toString()),
            ],
          )
        ],
      ),
      trailing: Icon(Icons.delete, color: Colors.white,),
    );
  }

}