import 'dart:ffi';
import 'package:irriot/constants.dart';
import 'package:irriot/models/userinfo.dart';
import 'package:irriot/screens/motor.dart';

import '../models/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irriot/screens/Sensors_Screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width;
    var screenHeight = queryData.size.height;

  
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 0,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Hello",
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            Text(
              'It\'s a nice day :D',
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.bold),
            )
          ]),
          backgroundColor: Colors.transparent,
          toolbarHeight: screenHeight/2.3888,
          flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
              image: AssetImage('assets/images/leaves.jpg'),
              fit: BoxFit.fill,
            ))),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 150,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              padding: EdgeInsets.only(top: 100, left: 20),
              child: Text(
                'Home',
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          Container(
            width: 700,

            padding: EdgeInsets.only(top: 30),

            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('assets/images/leaves.jpg'),
            //         fit: BoxFit.fill)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 150,
                    width: screenWidth / 2,
                    child: TextButton(
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage(
                                'assets/images/3887847.png',
                              ),
                              height: 100,
                              width: 120,
                            ),
                            Text('Sensors')
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SensorScreen()));
                        },
                        style: TextButton.styleFrom(
                            textStyle: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.transparent)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 150,
                    width: screenWidth / 2,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThreeButtonToggle()));
                      },
                      style: TextButton.styleFrom(
                          textStyle: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.transparent),
                      child: Column(
                        children: const [
                          Image(
                            image: AssetImage(
                              'assets/images/2479548.png',
                            ),
                            height: 100,
                            width: 120,
                          ),
                          Text('Motor')
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
