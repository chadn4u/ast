
import 'package:ast_apps/models/SectorModel.dart';
import 'package:flutter/material.dart';
import 'package:ast_apps/widgets/Sector/createCard.dart';

class Sector extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SectorState();
  
  }
  
  class _SectorState extends State<Sector> {
    List<SectorModel> lstSector=[
      SectorModel(area: 'Shop',sector: 'Sec1',sectorName: 'Sector 1',pic: 'Chad',lock1: 20,lock2: 0,lock3: 140),
      SectorModel(area: 'Warehouse',sector: '2',sectorName: 'Sector 2',pic: 'Dipta',lock1: 30,lock2: 0,lock3: 340),
      SectorModel(area: 'Shop',sector: '3',sectorName: 'Sector 3',pic: 'Priatmoko',lock1: 40,lock2: 0,lock3: 440),
      SectorModel(area: 'Warehouse',sector: '4',sectorName: 'Sector 4',pic: 'Alan',lock1: 50,lock2: 0,lock3: 440),
      SectorModel(area: 'Shop',sector: '5',sectorName: 'Sector 5',pic: 'Anto',lock1: 60,lock2: 0,lock3: 140),
      SectorModel(area: 'Warehouse',sector: '6',sectorName: 'Sector 6',pic: 'Suwidadi',lock1: 210,lock2: 0,lock3: 240),
      SectorModel(area: 'Shop',sector: '7',sectorName: 'Sector 7',pic: 'Hernawan',lock1: 120,lock2: 0,lock3: 740),
      SectorModel(area: 'Warehouse',sector: '8',sectorName: 'Sector 8',pic: 'Herman',lock1: 240,lock2: 0,lock3: 840),
      SectorModel(area: 'Shop',sector: '9',sectorName: 'Sector 9',pic: 'Ditto',lock1: 250,lock2: 0,lock3: 940),
      SectorModel(area: 'Warehouse',sector: '10',sectorName: 'Sector 10',pic: 'Wahyu',lock1: 260,lock2: 0,lock3: 140),
    ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sector'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: lstSector.length,
          itemBuilder: (BuildContext context, int index){
              return CreateCardSector(sectorModel: lstSector[index],);
          }),
      ),
      bottomNavigationBar: Container(
      height: 55.0,
      child: BottomAppBar(
        color: Colors.red,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){},
    backgroundColor: Colors.red,
    child: Icon(Icons.add),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}