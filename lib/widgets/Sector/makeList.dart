import 'package:ast_apps/models/SectorModel.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class MakeListSector extends StatefulWidget {

  final SectorModel sectorModel;

  MakeListSector({
    this.sectorModel
  });

  @override
  State < StatefulWidget > createState() => _MakeListSectorState();

}

class _MakeListSectorState extends State < MakeListSector > {
 

  

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
        child: Text(widget.sectorModel.sector, style: TextStyle(fontSize: 35, color: Colors.white), ),
      ),
      title: Align(
        alignment: Alignment.center,
        child: Text(widget.sectorModel.sectorName, style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.white), )),
      subtitle: Column(
        children: < Widget > [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.sectorModel.area, style: TextStyle(color: Colors.white))
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.sectorModel.pic, style: TextStyle(color: Colors.white))
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: < Widget > [
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.only(right: 10),
                child: Text(
                    widget.sectorModel.lock1.toString(),
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 1,
                      color: Colors.blueAccent
                    )
                  )
                ),
              ),
              Text(widget.sectorModel.lock3.toString(),
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
            ],
          )
        ],
      ),
      trailing: InkWell(
        onTap: () {},
        child: Icon(Icons.delete, color: Colors.white, )),
    );
  }

}