import 'package:cuoiki/home_page.dart';
import 'package:cuoiki/setting.dart';
import 'package:flutter/material.dart';

class man8 extends StatelessWidget {
  List<String> imagesList = [
    'assets/2.png',
    'assets/3.jpg',
    'assets/4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(243, 251, 250, 1),
            height: 570,
            child: Container(
              child: Column(
                children: [

                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Hello, Isaac",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Image(
                          image: AssetImage("1.png"),
                          width: 50,
                          height: 50,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 470,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: Colors.black12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.shopping_cart_rounded,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Visit the Aepod Store',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                            SizedBox(
                              width: 260,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 450,
                          height: 2,
                          color: Colors.black12,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                                'Buy attachments and supplements for your Aepod.\nOrders typically arrive in 3 working days')),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: 470,
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
                              Text("Language",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 51, 29, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              SizedBox(
                                width: 270,
                              ),
                              Text('English'),
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
                              Text("Currency",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 51, 29, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              SizedBox(
                                width: 294,
                              ),
                              Text('USD'),
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
                              Image(image: AssetImage('temperature.png')),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Temperature Unit",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 51, 29, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),

                              SizedBox(
                                width: 220,
                              ),
                              Text('Celsius'),
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
                              Icon(Icons.refresh, color: Colors.tealAccent),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Sync Settings",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 51, 29, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              SizedBox(
                                width: 300,
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Colors.green)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 60,),
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
                        Image(image: AssetImage('usercm.png')),
                        Text(
                          'Me',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(73, 173, 132, 100)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
