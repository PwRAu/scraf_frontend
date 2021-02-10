import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'config.dart';
import 'homepage.dart';

void main() async{
  box = await Hive.openBox('theme');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyApp createState()=> _MyApp();
  // This widget is the root of your application.
  
}

class _MyApp extends State<MyApp>{
  void initState(){
    super.initState();
    currentTheme.addListener(() {
      setState(() {
        
      });
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCRAF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: Colors.indigo,
        //buttonColor: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            //onPrimary: Colors.greenAccent[200],
            primary: Colors.blueAccent[200],
          )
        ),
      ),
      darkTheme: ThemeData.dark(),
      /*ThemeData(
        //tema switch
        primarySwatch: Colors.teal,
        //primaryColor: Colors.yellowAccent,
        canvasColor: Colors.grey[850],
        cardColor: Colors.grey[800],
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(backgroundColor: Colors.red),
        ),
        //tema dei bottoni
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            //onPrimary: Colors.greenAccent[200],
            primary: Colors.greenAccent[200],
          )
        ),
        textTheme: TextTheme(
          body1: TextStyle( color:Colors.white), 
        )
      ),*/
      themeMode: currentTheme.currentTheme(),
      home: Scrollbar(
          thickness: 8,
          child: SingleChildScrollView(
            //padding: EdgeInsets.only(top: 50),
            reverse: false,
            child: HomePage(),
          )),
    );
  }
}
