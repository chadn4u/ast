import 'package:ast_apps/models/SectorModel.dart';
import 'package:flutter/material.dart';
import 'package:ast_apps/widgets/Sector/createCard.dart';
import 'package:showcaseview/showcaseview.dart';

class Sector extends StatefulWidget {
  @override
  State < StatefulWidget > createState() => _SectorState();

}


class _SectorState extends State < Sector > {
  bool firstTime = true;
  BuildContext mContext;
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
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();

  @override
  void initState() {
    super.initState();
    //Start showcase view after current widget frames are drawn.
    WidgetsBinding.instance.addPostFrameCallback((_) =>
      ShowCaseWidget.of(mContext).startShowCase([_one, _two, _three]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sector'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child:
        firstTime ?
        ShowCaseWidget(
          onFinish: (){
            setState(() {
              firstTime = false;
            });
          },
          builder: Builder(builder: (context) {
            mContext = context;
            return Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Showcase(
                  key: _one,
                  description: 'data',
                  disableAnimation: true,
                  child: ListTile(
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
                      child: Text('1', style: TextStyle(fontSize: 35, color: Colors.white), ),
                    ),
                    title: Align(
                      alignment: Alignment.center,
                      child: Text('Dummy Sector', style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white), )),
                    subtitle: Column(
                      children: < Widget > [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Area Dummy', style: TextStyle(color: Colors.white))
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Test', style: TextStyle(color: Colors.white))
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: < Widget > [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.only(right: 10),
                              child: Showcase(
                                key: _two,
                                description: 'Lock 2 Value',
                                child: Text(
                                  '25',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    width: 1,
                                    color: Colors.blueAccent
                                  )
                                )
                              ),
                            ),
                            Showcase(
                              key: _three,
                              description: 'Lock 2 Value',
                              disableAnimation: true,
                              child: Text('99',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () {},
                      child: Icon(Icons.delete, color: Colors.white, )),
                  ),
                ),
              ),

            );
          }
            
          ),
        ) :
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: lstSector.length,
          itemBuilder: (BuildContext context, int index) {
            return CreateCardSector(sectorModel: lstSector[index], );
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
      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}