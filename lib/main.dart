import 'package:flutter/material.dart';
import 'package:todo_app/pages/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  

  //initialize the hive
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
  
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,

      ),
    );
  }
}