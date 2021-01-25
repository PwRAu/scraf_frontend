import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageHomeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _resize = 900;

    if(_width>=_resize)
    return Column(
      children: [
        FittedBox(
          child: Container(
            width: _width*0.8*0.55,
            height: 460,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple),
              image: DecorationImage(
                image: AssetImage('assets/FotoDiciotto_5.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            //child: Image.asset('assets/assets/FotoDiciotto_5.jpg',fit: BoxFit.fill,),
          )
        ),
      ],
    );
    return Column();
  }

}