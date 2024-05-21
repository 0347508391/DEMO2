import 'package:cuoiki/user.dart';
import 'package:cuoiki/setting.dart';
import 'package:flutter/material.dart';

import 'light_control_page.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 500,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(125),
                      bottomLeft: Radius.circular(125))),
              child: Container(
                margin: EdgeInsets.only(left: 50, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Hello, ',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white)),
                                Text('Farmer',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.lime)),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Green House',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            SizedBox(height: 4,),
                            Text('Galenbidunu wawe, Anuradhapura',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            SizedBox(height: 4,),
                            Text('200ha X 200ha',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 310, top: 20),
                          width: 80,
                          height: 80,
                          child:  Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage('ggmap.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 510.0,
                            height: 200.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 400,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Icon(
                              Icons.sunny,
                              size: 35.0,
                              color: Colors.cyan,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ControlLightPage()),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                elevation: MaterialStateProperty.all<double>(0.0),
                              ),
                              child: Text('Light', style: TextStyle(color: Colors.black),),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              size: 35.0,
                              color: Colors.cyan,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('10%')
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Icon(
                              Icons.thermostat,
                              size: 35.0,
                              color: Colors.cyan,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('24')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, left: 100),
                        child: Column(
                          children: [
                            Icon(
                              Icons.water,
                              size: 35.0,
                              color: Colors.cyan,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('High')
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, left: 150),
                        child: Column(
                          children: [
                            Icon(
                              Icons.thermostat_auto,
                              size: 35.0,
                              color: Colors.cyan,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('6.5')
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 80,
              color: Colors.lightGreen,
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  Image(image: AssetImage('home.png')),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(73, 173, 132, 100)),
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
                            builder: (context) => Setting(),
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
