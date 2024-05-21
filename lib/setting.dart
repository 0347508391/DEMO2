import 'package:cuoiki/home_page.dart';
import 'package:cuoiki/user.dart';
import 'package:flutter/material.dart';

import 'light_control_page.dart';

class Setting extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Setting', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            Container(
              width: 440,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.wifi, color: Colors.tealAccent),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Connectivity",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 51, 29, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        SizedBox(
                          width: 140,
                        ),
                        Text('Connected via Wifi'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.green)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 420,
                    height: 1,
                    color: Colors.black12,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.lightbulb, color: Colors.tealAccent),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Plantlight Settings",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 51, 29, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        SizedBox(
                          width: 140,
                        ),
                        Text('Currently ON'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.green)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 420,
                    height: 1,
                    color: Colors.black12,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image(image: AssetImage('chaucay.png')),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Cycle Settings",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 51, 29, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        SizedBox(
                          width: 255,
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.green)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 420,
                    height: 1,
                    color: Colors.black12,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.refresh, color: Colors.tealAccent),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Aepod Sync Settings",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 51, 29, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        SizedBox(
                          width: 210,
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.green)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 180,),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 80,
              color: Colors.lightGreen,
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child:  Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child:   Image(image: AssetImage('logokm.png')),)
                  ),


                  SizedBox(
                    width: 110,
                  ),
                  InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child:  Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child:   Image(image: AssetImage('tienich.png')),)
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => man8(),
                          ),
                        );
                      },
                      child:  Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child:   Image(image: AssetImage('user.png')),)
                  ),
                ],
              ),
            ),
          ],

        ),

      ),
    );
  }
}
