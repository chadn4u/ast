import 'package:ast_apps/models/AllProgress.dart';
import 'package:ast_apps/widgets/homePageBackground.dart';
import 'package:ast_apps/widgets/listProgress.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class MainPage extends StatefulWidget {
  @override
  State < StatefulWidget > createState() => _MainPageState();

}

class _MainPageState extends State < MainPage > {
  List<AllProgress> progressList;
  @override
  Widget build(BuildContext context) {
    progressList = [
      AllProgress(id: 1,maxValue: 56,minValue: 10,percent: 20,progressName: "Bulk Product"),
       AllProgress(id: 2,maxValue: 72,minValue: 32,percent: 40,progressName: "H&B"),
       AllProgress(id: 3,maxValue: 44,minValue: 5,percent:50,progressName: "Milk"),
       AllProgress(id: 4,maxValue: 122,minValue: 64,percent: 70,progressName: "All"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      drawer: Drawer(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill)
            ),
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: < Widget > [
                ListTile(
                  title: Text("Home"),
                ),
                ListTile(
                  title: Text("Sector"),
                ),
                ListTile(
                  title: Text("Summary"),
                ),
                ListTile(
                  title: Text("Progress Detail"),
                ),
                ListTile(
                  title: Text("Stock Take Result"),
                ),
                ListTile(
                  title: Text("Diff Countd. Article"),
                ),
                ListTile(
                  title: Text("Uncounted Article"),
                ),
                ListTile(
                  title: Text("Transfer to GMD"),
                ),
                ListTile(
                  title: Text("Logout"),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: < Widget > [
          HomePageBackground(screenHeight: MediaQuery.of(context).size.height),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: < Widget > [
              Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Server Time", style: TextStyle(fontSize: 20), )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Center(child: getTime()),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("All Progress", style: TextStyle(fontSize: 20), )),
              ),
              Expanded(
                              child: GridView.count(
                  crossAxisCount: 3,
                  padding: EdgeInsets.all(4.0),
                  children: progressList
                  .map(
                    (allProgresss) => AllProgressList(allProgress: allProgresss,),
                  )
                  .toList(),
                ),
              )
            ],
          )
        ],
      )
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
      print("${getSystemTime()}");
      return Text(
        "${getSystemTime()}",
        style: TextStyle(
          color: Color(0xff2d386b),
          fontSize: 30,
          fontWeight: FontWeight.w700),
      );
    });
  }


}