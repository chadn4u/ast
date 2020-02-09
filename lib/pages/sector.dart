import 'package:ast_apps/models/SectorModel.dart';
import 'package:ast_apps/utils/sessions/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:ast_apps/widgets/Sector/createCard.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class Sector extends StatefulWidget {
  @override
  State < StatefulWidget > createState() => _SectorState();

}

class _SectorState extends State < Sector > {
  final GlobalKey < ScaffoldState > _scaffoldKey = GlobalKey < ScaffoldState > ();
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();

  final titleController = TextEditingController();

  final idSectorController = TextEditingController();

  final picController = TextEditingController();
  List < String > lstArea = ['Shop', 'Warehouse', 'test'];

  String areaChoosed;

  List < SectorModel > lstSector = [
    SectorModel(area: 'Shop', sector: '1', sectorName: 'Sector 1', pic: 'Chad', lock1: 20, lock2: 0, lock3: 140),
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
  // Future < BuildContext > mContext;

  Future < BuildContext > insertContext(BuildContext ctx) async {
    return ctx;
  }

  void changeStateFirstTime(bool firstTimeP) {
    setState(() {
      SessionManagement.setBool('firstTime', firstTimeP);
      _firstTime = SessionManagement.getBool('firstTime');
    });
  }

  @override
  void initState() {
    super.initState();

    bool temp;
    // areaChoosed = lstArea[0];
    WidgetsBinding.instance.addPostFrameCallback((_) =>
      ShowCaseWidget.of(mContext).startShowCase([_one, _two, _three]));
    _firstTime = SessionManagement.getBool('firstTime').then((value) {
      // print(value);
      setState(() {
        if (value == null) {
          SessionManagement.setBool('firstTime', true);
          temp = true;


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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(143, 148, 251, 0.9)
    ));
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sector'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 0.9),
      ),
      body: ShowCaseWidget(
        onFinish: () {
          SessionManagement.setBool('firstTime', false);
          changeStateFirstTime(false);
        },
        builder: Builder(builder: (context) {
          mContext = context;
          return FutureBuilder(
            future: _firstTime,
            builder: (context, AsyncSnapshot < bool > snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data ? lstSectorFirstTime.length : lstSector.length,
                        itemBuilder: (BuildContext context, int index) {

                          return _createCardSector(index, snapshot.data);
                          // CreateCardSector(sectorModel: snapshot.data ? lstSectorFirstTime[index] : lstSector[index],
                          //   fnc: changeStateFirstTime,flagFirstTime: snapshot.data,mapKey: dataMap, );
                        }),
                    );
                  } else {
                    return Container(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: lstSector.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _createCardSector(index, false);
                          // CreateCardSector(sectorModel:  lstSector[index],
                          //   fnc: changeStateFirstTime,flagFirstTime: snapshot.data,mapKey: dataMap, );
                        }),
                    );
                  }
              }
            }
          );
        })
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Color.fromRGBO(143, 148, 251, 0.9),
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (BuildContext ctx, StateSetter state) {
                return GestureDetector(
                  onTap: () {},
                  behavior: HitTestBehavior.opaque,
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: < Widget > [
                          TextField(
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              labelText: 'Sector Name'),
                            controller: idSectorController,
                            //  onSubmitted: (_) => submitData(),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Title'
                            ),
                            controller: titleController,
                            //  controller: amountController,
                            //  onSubmitted: (_) => submitData(),
                          ),
                          Container(
                            height: 70,
                            child: Row(
                              children: < Widget > [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: < Widget > [
                                      TextField(
                                        decoration: InputDecoration(
                                          labelText: 'PIC'
                                        ),
                                        controller: picController,
                                        //  controller: amountController,
                                        //  onSubmitted: (_) => submitData(),
                                      ),
                                    ],
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: < Widget > [
                                      DropdownButton < String > (
                                        hint: Text('Pilih Area'),
                                        isExpanded: false,
                                        value: areaChoosed,
                                        isDense: true,
                                        items: lstArea.map((String item) {
                                          return DropdownMenuItem < String > (
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                color: Colors.black
                                              ),
                                            )
                                          );
                                        }).toList(),
                                        onChanged: (String item) {
                                          state(() {
                                            areaChoosed = item;
                                            print(item);
                                          });
                                        }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            child: GestureDetector(
                              onTap: () {
                                print('tai');
                                Navigator.pop(ctx);
                                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Submit Tapped")));
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6)
                                  ])
                                ),
                                margin: EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Text('Submit'),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
                );
              });

            });
        },
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        child: Icon(Icons.add)

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  _createCardSector(int index, bool flagFirstTIme) {
    return InkWell(
      onTap: () {
        Scaffold.of(mContext).removeCurrentSnackBar();
        Scaffold.of(mContext).showSnackBar(SnackBar(content: Text("Sector  clicked")));
      },
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(143, 148, 251, 0.9),
          ),
          child: _makeListSector(flagFirstTIme, flagFirstTIme ? lstSectorFirstTime[index] : lstSector[index]),
        ),

      ),
    );
  }

  _makeListSector(bool flagFirstTime, SectorModel sectorModel) {
    return (flagFirstTime != null && flagFirstTime) ?
      Showcase(
        key: _one,
        description: 'Ini Data',
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
            child: Text(sectorModel.sector, style: TextStyle(fontSize: 35, color: Colors.white), ),
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(sectorModel.sectorName, style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.white), )),
          subtitle: Column(
            children: < Widget > [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(sectorModel.area, style: TextStyle(color: Colors.white))
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(sectorModel.pic, style: TextStyle(color: Colors.white))
              ),
              Row(
                children: < Widget > [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.only(right: 10),
                    child: Showcase(
                      key: _two,
                      title: 'Lock 1',
                      description: 'Data Lock 1',
                      showcaseBackgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      shapeBorder: CircleBorder(),
                      disableAnimation: true,
                      child: Text(
                        sectorModel.lock1.toString(),
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
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.only(right: 10),
                    child: Showcase(
                      key: _three,
                      description: 'Ini Lock 3',
                      title: 'Lock 3',

                      showcaseBackgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      shapeBorder: CircleBorder(),
                      disableAnimation: true,
                      child: Text(sectorModel.lock3.toString(),
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          trailing: InkWell(
            onTap: () {

            },
            child: Icon(Icons.delete, color: Colors.white, )),
        ),

      ) :
      ListTile(
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
          child: Text(sectorModel.sector, style: TextStyle(fontSize: 35, color: Colors.white), ),
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(sectorModel.sectorName, style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.white), )),
        subtitle: Column(
          children: < Widget > [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(sectorModel.area, style: TextStyle(color: Colors.white))
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(sectorModel.pic, style: TextStyle(color: Colors.white))
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: < Widget > [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    sectorModel.lock1.toString(),
                    style: TextStyle(
                      color: Colors.white
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
                ), Text(sectorModel.lock3.toString(),
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ],
            )
          ],
        ),
        trailing: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Kamu Yakin?'),
                content: Text('Kamu akan mengurangi data sector?'),
                actions: < Widget > [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                    child: Text('No', style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                    child: Text('Yes', style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ))
                  )
                ],
              )
            ).then((value) {
              if (value) {
                setState(() {
                  lstSector.removeWhere((item) => item.sector == sectorModel.sector);
                });
              }

            });

          },
          child: Icon(Icons.delete, color: Colors.white, )
        )
      );
  }
}