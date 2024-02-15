import 'package:firstapp/firstpage/login.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(Project());
}

class Project extends StatefulWidget {
  Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Banner());
  }
}

class Banner extends StatefulWidget {
  const Banner({super.key});

  @override
  State<Banner> createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color(0xFF450202),
              Color(0xE6FF0909),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Transform.rotate(
          angle: -math.pi / 12.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Image.asset('images/biglogo.png'),
              _Label('Get started for daily \n trending news! ', 20,
                  padding: EdgeInsets.only(top: 2)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _Label(String text, double fontSize, {required EdgeInsets padding}) {
  return Padding(
    padding: padding ?? EdgeInsets.all(0), // Adjust the padding as needed
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// Widget Button() {
//   return Container(
//     width: 200,
//     height: 50,
//     decoration: BoxDecoration(
//       color: Colors.red,
//       borderRadius: BorderRadius.circular(34),
//     ),
//     child: Column(
//       children: [
//         Center(
//           child: Text(
//             'getstarted',
//             style: TextStyle(
//                 color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
//           ),
//         ),
//        return GestureDetector(
//       onTap: () {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (BuildContext context) {
//           return Second();
//         }));
//       ],
//     ),
//   );
// }
