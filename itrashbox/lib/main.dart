import 'package:flutter/material.dart';
import 'package:itrashbox/scaffold/admin.dart';
import 'package:itrashbox/scaffold/emeter.dart';
import 'package:itrashbox/scaffold/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage1(x: '123123132',)//(title: "gggg",),
    );
  }
}

