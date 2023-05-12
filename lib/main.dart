import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: clock(),
  ));
}

class clock extends StatefulWidget {
  const clock({Key? key}) : super(key: key);

  @override
  State<clock> createState() => _clockState();
}

class _clockState extends State<clock> {
  int s = 0;
  int h = 0;
  int m = 0;
  int n = DateTime.now().weekday;
  List day = [
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY"
  ];

  myclock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        s++;
        if (s >= 59) {
          m++;
          s = 0;
        } else if (m >= 59) {
          h++;
          m = 0;
        } else if (h >= 12) {
          h -= 12;
        }
      });
      myclock();
    });
  }

  @override
  void initState() {
    myclock();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CLOCK APP",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(75),
                  alignment: Alignment.topCenter,
                  height: 320,
                  width: 320,
                  child: Text(
                    "${DateTime.now().hour}:${DateTime.now().minute}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: Colors.white),
                  ),
                ),
              ),
              Transform.scale(
                scale: 9,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.green,
                  value: DateTime.now().second / 60,
                ),
              ),
              Transform.scale(
                scale: 8,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                  value: DateTime.now().minute / 60,
                ),
              ),
              Transform.scale(
                scale: 7,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.orange,
                  value: DateTime.now().hour / 12,
                ),
              ),
              Transform.rotate(
                angle: (pi * 3 / 2),
                child: Transform.rotate(
                  angle: (pi * 2) * (DateTime.now().second / 60),
                  child: Divider(
                    color: Colors.white,
                    thickness: 4,
                    indent: 200,
                    endIndent: 40,
                  ),
                ),
              ),
              Transform.rotate(
                angle: (pi * 3 / 2),
                child: Transform.rotate(
                  angle: (pi * 2) * (DateTime.now().minute / 60),
                  child: Divider(
                    color: Colors.white70,
                    thickness: 5,
                    indent: 200,
                    endIndent: 60,
                  ),
                ),
              ),
              Transform.rotate(
                angle: (3 * pi / 2),
                child: Transform.rotate(
                  angle: (pi * 2) * (DateTime.now().hour / 12),
                  child: Divider(
                    color: Colors.redAccent,
                    thickness: 7,
                    indent: 200,
                    endIndent: 75,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(80),
            height: 150,
            width: 250,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}\n ${day[n - 1]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                  // Text("${day[n - 1]}"),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
