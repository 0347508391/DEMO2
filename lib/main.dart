import 'package:flutter/material.dart';
import 'login.dart';
import 'setting.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trang chu',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Setting(),
    );
  }
}
