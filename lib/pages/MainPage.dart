import 'package:ast_apps/models/AllProgress.dart';
import 'package:ast_apps/pages/progress.dart';
import 'package:ast_apps/pages/sector.dart';
import 'package:ast_apps/pages/uncountArticle.dart';
// import 'package:ast_apps/widgets/homePageBackground.dart';
// import 'package:ast_apps/widgets/listProgress.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rounded_letter/rounded_letter.dart';
import 'package:rounded_letter/shape_type.dart';
import 'package:timer_builder/timer_builder.dart';

class MainPage extends StatefulWidget {
  @override
  State < StatefulWidget > createState() => _MainPageState();

}

class _MainPageState extends State < MainPage > {
  List < AllProgress > progressList;

  _gridItem(icon, menuName,classPage) {
    return GestureDetector(
      onTap: (){
        (classPage != null)?
        Navigator.push(context, MaterialPageRoute(builder: (context) => classPage))
        :
        Navigator.of(context).pop(false)
        ;
      },
      child: Column(
        children: < Widget > [
          CircleAvatar(
            child: 
              ImageIcon(
                AssetImage(icon),
                color: Colors.white
              )//child: Icon(icon, size: 16, color: Colors.white, )
            ,
            backgroundColor: Color.fromRGBO(143, 148, 251, 0.9),
          ),
          SizedBox(height: 10, ),
          Text(menuName, style:
            TextStyle(
              fontSize: 10
            ),
          )
        ],
      ),
    );
  }
  _top() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(143, 148, 251, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      ),
      child: Column(
        children: < Widget > [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: < Widget > [
              Row(
                children: < Widget > [
                  RoundedLetter(
                    text: "CH",
                    shapeColor: Color.fromRGBO(143, 148, 251, 1),
                    shapeType: ShapeType.circle,
                    borderColor: Colors.white,
                    borderWidth: 2,
                  ),
                  SizedBox(width: 10, ),
                  Text('Halo, Chad selamat datang',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white, ),
                onPressed: () {
                  Navigator.pop(context);
                }
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Server Time", style: TextStyle(fontSize: 20, color: Colors.white), )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
              child: Center(child: getTime(), //getTime()
              ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    progressList = [
      AllProgress(id: 1, maxValue: 56, minValue: 10, percent: 20, progressName: "Bulk Product"),
      AllProgress(id: 2, maxValue: 72, minValue: 32, percent: 40, progressName: "H&B"),
      AllProgress(id: 3, maxValue: 44, minValue: 5, percent: 50, progressName: "Milk"),
      AllProgress(id: 4, maxValue: 122, minValue: 64, percent: 70, progressName: "All"),
    ];
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Mains Page"),
      // ),
      // drawer: Drawer(
      //   child: Align(
      //     alignment: Alignment.bottomCenter,
      //     child: Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage('assets/images/background.png'),
      //           fit: BoxFit.fill)
      //       ),
      //       child: ListView(
      //         padding: EdgeInsets.all(10.0),
      //         children: < Widget > [
      //           ListTile(
      //             title: Text("Home"),
      //           ),
      //           ListTile(
      //             title: Text("Sector"),
      //             onTap: (){
      //               Navigator.push(context, MaterialPageRoute(builder: (context) => Sector()));
      //             },
      //           ),
      //           ListTile(
      //             title: Text("Summary"),
      //           ),
      //           ListTile(
      //             title: Text("Progress Detail"),
      //           ),
      //           ListTile(
      //             title: Text("Stock Take Result"),
      //           ),
      //           ListTile(
      //             title: Text("Diff Countd. Article"),
      //           ),
      //           ListTile(
      //             title: Text("Uncounted Article"),
      //           ),
      //           ListTile(
      //             title: Text("Transfer to GMD"),
      //           ),
      //           ListTile(
      //             title: Text("Logout"),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: ListView(
        children: < Widget > [
          _top(),
          SizedBox(height: 20, ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: < Widget > [
                Text('Menu', style:
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(143, 148, 251, 1)
                  ),
                ),
                // Text('View All', style: TextStyle(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 12,
                //   color: Color.fromRGBO(143, 148, 251, 1)
                // ), )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 4 / 4
              ),
              children: < Widget > [
                _gridItem('assets/images/sector.png', 'Sector',Sector()),
                _gridItem('assets/images/summary.png', 'Summary',null),
                _gridItem('assets/images/progressDetail.png', 'Progress Detail',null),
                _gridItem('assets/images/stockTakeResult.png', 'Stock Take Result',null),
                _gridItem('assets/images/diffCount.png', 'Diff Countd. Article',null),
                _gridItem('assets/images/count.png', 'Uncounted Article',UncountedArticle()),
                _gridItem('assets/images/transferGmd.png', 'Transfer to GMD',null),
                _gridItem('assets/images/progress.png', 'Progress',Progress()),
              ],
            ),
          )
        ],
      )
      // Stack(
      //   children: < Widget > [
      //     HomePageBackground(screenHeight: MediaQuery.of(context).size.height),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: < Widget > [
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //             child: Center(child: Text("Server Time", style: TextStyle(fontSize: 20), )),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //             child: Center(child: Text('tai') //getTime()
      //             ),
      //         ),
      //         SizedBox(
      //           height: 60,
      //         ),
      //         // Card(
      //         //   child: ,
      //         // )
      //         // Padding(
      //         //   padding: const EdgeInsets.all(8.0),
      //         //     child: Center(child: Text("All Progress", style: TextStyle(fontSize: 20), )),
      //         // ),
      //         // Expanded(
      //         //                 child: GridView.count(
      //         //     crossAxisCount: 3,
      //         //     padding: EdgeInsets.all(4.0),
      //         //     children: progressList
      //         //     .map(
      //         //       (allProgresss) => AllProgressList(allProgress: allProgresss,),
      //         //     )
      //         //     .toList(),
      //         //   ),
      //         // )
      //       ],
      //     )
      //   ],
      // )
      ,
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Color.fromRGBO(143, 148, 251, 0.9),
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 1.0),
                icon: ImageIcon(
                  AssetImage('assets/images/scanResult.png'),
                  color: Colors.white,
                ),
                onPressed: () {
                  
                },
              ),
              // IconButton(
              //   iconSize: 30.0,
              //   padding: EdgeInsets.only(right: 28.0),
              //   icon: Icon(Icons.search,color: Colors.white),
              //   onPressed: () {
                 
              //   },
              // ),
              // IconButton(
              //   iconSize: 30.0,
              //   padding: EdgeInsets.only(left: 38.0),
              //   icon: Icon(Icons.notifications,color: Colors.white,),
              //   onPressed: () {
                  
              //   },
              // ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 1.0),
                icon: Icon(Icons.list,color: Colors.white),
                onPressed: () {
                  
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Color.fromRGBO(143, 148, 251, 0.9),
        child: ImageIcon(
          AssetImage('assets/images/scan.png'),
          color:Colors.white
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class getTime extends StatelessWidget {
  String getSystemTime() {
    var now = DateTime.now();
    return new DateFormat("HH:mm:ss").format(now);
  }
  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      return Text(
        "${getSystemTime()}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w700),
      );
    });
  }


}