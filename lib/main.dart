import 'package:ast_apps/Animation/FadeAnimation.dart';
import 'package:ast_apps/models/Division.dart';
import 'package:ast_apps/pages/MainPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50:Color.fromRGBO(143, 148, 251, .1),
      100:Color.fromRGBO(143, 148, 251, .2),
      200:Color.fromRGBO(143, 148, 251, .3),
      300:Color.fromRGBO(143, 148, 251, .4),
      400:Color.fromRGBO(143, 148, 251, .5),
      500:Color.fromRGBO(143, 148, 251, .6),
      600:Color.fromRGBO(143, 148, 251, .7),
      700:Color.fromRGBO(143, 148, 251, .8),
      800:Color.fromRGBO(143, 148, 251, .9),
      900:Color.fromRGBO(143, 148, 251, 1),
    };
    MaterialColor colorCustom = MaterialColor(0xFF8f94fb, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: colorCustom,
        backgroundColor: Colors.white
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title
  }): super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State < MyHomePage > {
  int _counter = 0;

  List < Divisions > divisions = < Divisions > [Divisions(1, "Fresh & Weighted"), Divisions(2, "Non Fresh & Non Weighted")];

  Divisions _divisionChoosed;

  @override
  void initState(){
    super.initState();
    _divisionChoosed = divisions[0];
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
        
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: < Widget > [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill)
                ),
                child: FadeAnimation(1.6, Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: <Widget>[
                       Center(
                        child: Text("AST Mobile Apps", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold), ),
                      ),
                    ],
                  ),
                )),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: < Widget > [
                    FadeAnimation(1.8, Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, 2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10)
                          )
                        ]
                      ),
                      child: Column(
                        children: < Widget > [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100]
                                )
                              )
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey[400])
                              )
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100]
                                )
                              )
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              obscureText: true,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[100]
                                )
                              )
                            ),
                            child: DropdownButton < Divisions > (
                              isExpanded: true,
                              value: _divisionChoosed,
                              items: divisions.map((Divisions item) {
                                return DropdownMenuItem < Divisions > (
                                  value: item,
                                  child: Text(
                                    item.divisionName,
                                    style: TextStyle(
                                      color: Colors.black
                                    ),
                                  )
                                );
                              }).toList(),
                              onChanged: (Divisions item) {
                                setState(() {
                                  _divisionChoosed = item;
                                  print(item.divisionName);
                                });
                              })
                          ),
                        ],
                      ),
                    ), ),
                    SizedBox(height: 30, ), FadeAnimation(2, GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ]
                          )
                        ),
                        child: Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), ),
                        ),
                      ),
                    )),
                  ],
                ), )
            ],
          ),
        ),
      ),
    );
  }
}