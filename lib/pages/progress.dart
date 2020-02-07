import 'package:ast_apps/models/AllProgress.dart';
import 'package:ast_apps/models/storeModel.dart';
import 'package:ast_apps/utils/customShapeClipper.dart';
import 'package:ast_apps/widgets/listProgress.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  @override
  State < StatefulWidget > createState() => _ProgressState();

}

class _ProgressState extends State < Progress > {
  List < ModelStore > lstStore = [
    ModelStore(strCd: '04001', strNm: 'GANDARIA'),
    ModelStore(strCd: '04002', strNm: 'RATU PLAZA'),
    ModelStore(strCd: '04003', strNm: 'FESTIVAL CITY LINK'),
    ModelStore(strCd: '04004', strNm: 'KELAPA GADING'),
    ModelStore(strCd: '04005', strNm: 'KUNINGAN CITY'),
    ModelStore(strCd: '06001', strNm: 'PASAR REBO'),
    ModelStore(strCd: '06002', strNm: 'SIDOARJO, SURABAYA'),
    ModelStore(strCd: '06003', strNm: 'KELAPA GADING'),
    ModelStore(strCd: '06004', strNm: 'MERUYA'),
    ModelStore(strCd: '06005', strNm: 'BANDUNG'),
    ModelStore(strCd: '04004', strNm: 'KELAPA GADING'),
    ModelStore(strCd: '04005', strNm: 'KUNINGAN CITY'),
    ModelStore(strCd: '06001', strNm: 'PASAR REBO'),
    ModelStore(strCd: '06002', strNm: 'SIDOARJO, SURABAYA'),
    ModelStore(strCd: '06003', strNm: 'KELAPA GADING'),
    ModelStore(strCd: '06004', strNm: 'MERUYA'),
    ModelStore(strCd: '06005', strNm: 'BANDUNG'),
  ];

  ModelStore storeListed;

  @override
  void initState() {
    storeListed = lstStore[0];
  }

  @override
  Widget build(BuildContext context) {
    List < AllProgress > progressList = [
      AllProgress(id: 1, maxValue: 56, minValue: 10, percent: 20, progressName: "Bulk Product"),
      AllProgress(id: 2, maxValue: 72, minValue: 32, percent: 40, progressName: "H&B"),
      AllProgress(id: 3, maxValue: 44, minValue: 5, percent: 50, progressName: "Milk"),
      AllProgress(id: 4, maxValue: 122, minValue: 64, percent: 70, progressName: "All"),
      AllProgress(id: 1, maxValue: 56, minValue: 10, percent: 20, progressName: "Bulk Product"),
      AllProgress(id: 2, maxValue: 72, minValue: 32, percent: 40, progressName: "H&B"),
      AllProgress(id: 3, maxValue: 44, minValue: 5, percent: 50, progressName: "Milk"),
      AllProgress(id: 4, maxValue: 122, minValue: 64, percent: 70, progressName: "All"),
      AllProgress(id: 1, maxValue: 56, minValue: 10, percent: 20, progressName: "Bulk Product"),
      AllProgress(id: 2, maxValue: 72, minValue: 32, percent: 40, progressName: "H&B"),
      AllProgress(id: 3, maxValue: 44, minValue: 5, percent: 50, progressName: "Milk"),
      AllProgress(id: 4, maxValue: 122, minValue: 64, percent: 70, progressName: "All"),
      AllProgress(id: 1, maxValue: 56, minValue: 10, percent: 20, progressName: "Bulk Product"),
      AllProgress(id: 2, maxValue: 72, minValue: 32, percent: 40, progressName: "H&B"),
      AllProgress(id: 3, maxValue: 44, minValue: 5, percent: 50, progressName: "Milk"),
      AllProgress(id: 4, maxValue: 122, minValue: 64, percent: 70, progressName: "All"),
    ];
    return Scaffold(
      body: Stack(
        children: < Widget > [
          ClipPath(clipper: CustomShapeClipper(),
            child: Container(
              height: 350,
              color: Color.fromRGBO(143, 148, 251, 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
              child: Column(
                children: < Widget > [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: < Widget > [
                      Row(
                        children: < Widget > [
                          IconButton(iconSize: 40,
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white, ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }
                          ),
                          SizedBox(width: 10, ),
                          Text('All Progress',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Theme(
                    data: ThemeData(
                      canvasColor: Colors.white
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child: DropdownButton < ModelStore > (
                        isExpanded: true,
                        hint: Text('Pilih Store'),
                        value: storeListed,
                        iconSize: 40,
                        iconEnabledColor: Color.fromRGBO(143, 148, 251, 1),
                        items: lstStore.map((ModelStore item) {
                          return DropdownMenuItem < ModelStore > (
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${item.strCd} - ${item.strNm}',
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)
                                ),
                              ),
                            )
                          );
                        }).toList(),
                        onChanged: (ModelStore item) {
                          setState(() {
                            storeListed = item;
                          });
                        }),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: progressList
                      .map(
                        (allProgresss) => AllProgressList(allProgress: allProgresss, ),
                      )
                      .toList(),
                    ),
                  ),
                ],
              ),
          )
        ],
      ),
    );
  }

}