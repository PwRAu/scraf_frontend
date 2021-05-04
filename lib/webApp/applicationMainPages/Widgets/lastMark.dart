import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home/webApp/applicationMainPages/subjcetPage.dart';

class LastMarks extends StatelessWidget {
  double menuSize;
  LastMarks({this.menuSize});
  Widget build(BuildContext context) {
    List<Marks> subMarks = [];
    for (int i = 1; i < 6; i++) {
      var r = new Random();
      double n = r.nextDouble() * 9 + 1;
      n = num.parse(n.toStringAsFixed(1));
      subMarks.add(Marks(
          vote: n, description: "questo è quel cazzo di voto che hai preso"));
    }
    double _width = MediaQuery.of(context).size.width;
    return Positioned(
      top: 625,
      left: (_width - menuSize) * (1 / 50) + _width * 0.43,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "ultimi voti",
              style: TextStyle(fontSize: 21),
            ),
            Container(
              width: (_width - menuSize) * 0.45,
              height: 500,
              child: ListView.builder(
                itemCount: subMarks.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Container(
                      width: (_width - menuSize) * 0.45 * 0.5,
                      height: 75,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 25,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: (_width - menuSize) * 0.45 * 0.55,
                                  height: 75,
                                  child: Text(
                                    subMarks[i].description,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 5,
                            child: Container(
                              width: 50,
                              height: 75,
                              child: Center(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: subMarks[i].vote > 6
                                        ? Colors.green
                                        : Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      subMarks[i].vote.toInt().toString(),
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
