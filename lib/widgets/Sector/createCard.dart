
import 'package:ast_apps/models/SectorModel.dart';
import 'package:flutter/material.dart';
import 'package:ast_apps/widgets/Sector/makeList.dart';

class CreateCardSector extends StatelessWidget{
  final SectorModel sectorModel;

  CreateCardSector({this.sectorModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(143, 148, 251, 1),
        ),
        child: MakeListSector(sectorModel: sectorModel,),
      ),

    );
  }

}