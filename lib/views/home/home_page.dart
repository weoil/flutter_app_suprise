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
        width: 750.w,
        color: Colors.blue[300],
        child: Center(
          child: Text(
            "Hello Dog",
            style: TextStyle(color: Colors.white, fontSize: 82.sp),
          ),
        ),
      ),
    );
  }
}
