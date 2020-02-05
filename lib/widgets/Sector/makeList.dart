import 'package:ast_apps/models/SectorModel.dart';
import 'package:ast_apps/utils/sessions/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class MakeListSector extends StatefulWidget {

  final SectorModel sectorModel;
  final Function fnc;
  final bool flagFirstTime;
  final Map mapKey;

  MakeListSector({
    this.sectorModel,
    this.fnc,
    @required this.flagFirstTime,
    this.mapKey
  });

  @override
  State < StatefulWidget > createState() => _MakeListSectorState();

}

class _MakeListSectorState extends State < MakeListSector > {


  @override
  Widget build(BuildContext context) {

    // if (await _firstTime == true) {
    return (widget.flagFirstTime != null && widget.flagFirstTime) ?
      ShowCaseWidget(
        onFinish: () {
          SessionManagement.setBool('firstTime', false);
          widget.fnc(false);
        },
        builder: Builder(builder: (context) {
          return Showcase(
            key: widget.mapKey['_one'],
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
                  Row(
                    children: < Widget > [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(right: 10),
                        child: Showcase(
                          key: widget.mapKey['_two'],
                          title: 'Lock 1',
                          description: 'Data Lock 1',
                          showcaseBackgroundColor: Colors.blueAccent,
                          textColor: Colors.white,
                          shapeBorder: CircleBorder(),
                          disableAnimation: true,
                          child: Text(
                            widget.sectorModel.lock1.toString(),
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
                          key: widget.mapKey['_three'],
                          description: 'Ini Lock 3',
                          title: 'Lock 3',

                          showcaseBackgroundColor: Colors.blueAccent,
                          textColor: Colors.white,
                          shapeBorder: CircleBorder(),
                          disableAnimation: true,
                          child: Text(widget.sectorModel.lock3.toString(),
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
                onTap: () {},
                child: Icon(Icons.delete, color: Colors.white, )),
            ),
          );
        }),
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
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 1,
                        color: Colors.blueAccent
                      )
                    )
                  ),
                ), Text(widget.sectorModel.lock3.toString(),
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
          child: Icon(Icons.delete, color: Colors.white, )
        )
      );
    // } else {

    // }

  }

}