import 'package:ast_apps/models/SectorModel.dart';
import 'package:ast_apps/utils/sessions/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:ast_apps/widgets/Sector/createCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class Sector extends StatefulWidget {
  @override
  State < StatefulWidget > createState() => _SectorState();

}

class _SectorState extends State < Sector > {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();

  List < SectorModel > lstSector = [
    SectorModel(area: 'Shop', sector: 'Sec1', sectorName: 'Sector 1', pic: 'Chad', lock1: 20, lock2: 0, lock3: 140),
    SectorModel(area: 'Warehouse', sector: '2', sectorName: 'Sector 2', pic: 'Dipta', lock1: 30, lock2: 0, lock3: 340),
    SectorModel(area: 'Shop', sector: '3', sectorName: 'Sector 3', pic: 'Priatmoko', lock1: 40, lock2: 0, lock3: 440),
    SectorModel(area: 'Warehouse', sector: '4', sectorName: 'Sector 4', pic: 'Alan', lock1: 50, lock2: 0, lock3: 440),
    SectorModel(area: 'Shop', sector: '5', sectorName: 'Sector 5', pic: 'Anto', lock1: 60, lock2: 0, lock3: 140),
    SectorModel(area: 'Warehouse', sector: '6', sectorName: 'Sector 6', pic: 'Suwidadi', lock1: 210, lock2: 0, lock3: 240),
    SectorModel(area: 'Shop', sector: '7', sectorName: 'Sector 7', pic: 'Hernawan', lock1: 120, lock2: 0, lock3: 740),
    SectorModel(area: 'Warehouse', sector: '8', sectorName: 'Sector 8', pic: 'Herman', lock1: 240, lock2: 0, lock3: 840),
    SectorModel(area: 'Shop', sector: '9', sectorName: 'Sector 9', pic: 'Ditto', lock1: 250, lock2: 0, lock3: 940),
    SectorModel(area: 'Warehouse', sector: '10', sectorName: 'Sector 10', pic: 'Wahyu', lock1: 260, lock2: 0, lock3: 140),
  ];

  List < SectorModel > lstSectorFirstTime = [
    SectorModel(area: 'Shop', sector: '1', sectorName: 'Sector Dummy', pic: 'test', lock1: 20, lock2: 0, lock3: 140),
  ];
  Future < bool > _firstTime;
  BuildContext mContext;
  Map dataMap = Map();


  void changeStateFirstTime(bool firstTimeP) {
    setState(() {
      SessionManagement.setBool('firstTime', firstTimeP);
      _firstTime = SessionManagement.getBool('firstTime');
    });
  }

  @override
  void initState() {
    super.initState();
    dataMap['_one'] = _one;
    dataMap['_two'] = _two;
    dataMap['_three'] = _three;
    bool temp;
    _firstTime = SessionManagement.getBool('firstTime').then((value) {
      // print(value);
      setState(() {
        if (value == null) {
          SessionManagement.setBool('firstTime', true);
          WidgetsBinding.instance.addPostFrameCallback((_) =>
            ShowCaseWidget.of(mContext).startShowCase([_one, _two, _three]));

        } else {
          temp = value;
          SessionManagement.setBool('firstTime', value);
        }

      });
      return temp;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sector'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: _firstTime,
        builder: (context, AsyncSnapshot < bool > snapshot) {
          mContext = context;
          if(snapshot.hasData){
            return Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data ? lstSectorFirstTime.length : lstSector.length,
              itemBuilder: (BuildContext context, int index) {
                return CreateCardSector(sectorModel: snapshot.data ? lstSectorFirstTime[index] : lstSector[index],
                  fnc: changeStateFirstTime,flagFirstTime: snapshot.data,mapKey: dataMap, );
              }),
            );
          }else{
            return Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:  lstSector.length,
              itemBuilder: (BuildContext context, int index) {
                return CreateCardSector(sectorModel:  lstSector[index],
                  fnc: changeStateFirstTime,flagFirstTime: snapshot.data,mapKey: dataMap, );
              }),
            );
          }
          
        }
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
      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}