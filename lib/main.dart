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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
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
