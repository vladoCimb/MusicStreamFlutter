import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  double _thumbPercent = 0.4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.brown[600],
          ),
          onPressed: () {},
        ),
        title: Text("Music World",
            style: TextStyle(color: Colors.brown[600], fontFamily: "Nexa")),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.brown[600],
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Container(
              width: 250.0,
              height: 250.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.brown[600].withOpacity(.5),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: _buildRadialSeekBar(),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: ClipOval(
                          clipper: MClipper(),
                          child: Image.asset(
                            "assets/chester.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Column(
            children: <Widget>[
              Text(
                "Linkin Park",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontFamily: "Nexa",
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "In the end",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: "NexaLight",
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 350.0,
            height: 150.0,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 65.0,
                    width: 290.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown[600], width: 3.0),
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.fast_rewind,
                            size: 55.0,
                            color: Colors.brown[600],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Icon(
                            Icons.fast_forward,
                            size: 55.0,
                            color: Colors.brown[600],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 92.0,
                    height: 92.0,
                    decoration: BoxDecoration(
                      color: Colors.brown[600],
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 45.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 190.0,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: -20,
                  child: Container(
                    width: 50.0,
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Colors.brown[600],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0))),
                  ),
                ),
                Positioned(
                  right: -20,
                  child: Container(
                    width: 50.0,
                    height: 190.0,
                    decoration: BoxDecoration(
                        color: Colors.brown[600],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0))),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      song('assets/1.jpg', 'Bleed It Out',
                          'Minutes to Midnight 2017'),
                      song(
                          'assets/2.png', 'I’ll Be Gone', 'Living Things 2012'),
                      song('assets/3.jpeg', 'Runaway', 'Hybrid Theory 2000'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget song(String image, String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.only(left: 100),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image.asset(
              image,
              width: 40.0,
              height: 40.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700)),
                Text(subtitle, style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRadialSeekBar() {
    return RadialSeekBar(
      trackColor: Colors.brown[600].withOpacity(.5),
      trackWidth: 2.0,
      progressColor: Colors.brown[600],
      progressWidth: 5.0,
      thumbPercent: _thumbPercent,
      thumb: CircleThumb(
        color: Colors.brown[600],
        diameter: 20.0,
      ),
      progress: _thumbPercent,
      onDragUpdate: (double percent) {
        setState(() {
          _thumbPercent = percent;
        });
      },
    );
  }
}

class MClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
