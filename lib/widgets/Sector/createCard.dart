
import 'package:ast_apps/models/SectorModel.dart';
import 'package:flutter/material.dart';
import 'package:ast_apps/widgets/Sector/makeList.dart';

class CreateCardSector extends StatelessWidget{
  final SectorModel sectorModel;
  final Function fnc;
  final bool flagFirstTime;
  final Map mapKey;

  CreateCardSector({this.sectorModel,this.fnc,@required this.flagFirstTime,this.mapKey});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Sector ${sectorModel.sectorName} clicked")
          )
        );
      },
        child: Card(
        elevation: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: MakeListSector(sectorModel: sectorModel,fnc:fnc,flagFirstTime: flagFirstTime,mapKey: mapKey,),
        ),

      ),
    );
  }

}