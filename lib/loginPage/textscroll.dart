import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Photo extends StatefulWidget {
  Photo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width / 2,
        child: Carousel(
          showIndicator: false,
          autoplayDuration: Duration(seconds: 5),
          dotSize: 10.0,
          dotSpacing: 20.0,
          dotColor: Colors.grey,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.transparent,
          dotVerticalPadding: 5.0,
          dotPosition: DotPosition.bottomCenter,
          images: [
            Center(
              child: Container(
                //width: _width / 2.5,
                //height: _height / 1.5,
                //padding: EdgeInsets.only(left: 100, top: _height / 3.5),
                padding: EdgeInsets.only(left: 100),
                child: Text(
                  "Prediti cura della tua carriera scolastica o dei tuoi alunni",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 40),
                ), /*
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("sunset.jpg"),fit: BoxFit.fill),
                ),*/
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 100),
                child: Text(
                  "Controlla l'andamento con l'aiuto di grafici",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 100),
                child: Text(
                  "Crea e partecipa ai sondaggi",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 100),
                child: Text(
                  "Goditi l'esperienza di Scraf e migliora la tua esperienza scolastica",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
