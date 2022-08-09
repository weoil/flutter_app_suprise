import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// appBar: ,
      body: Container(
        width: 100,
        color: Colors.yellow,
        child: Column(
          children: const [Text("HelloWorld")],
        ),
      ),
    );
  }
}
