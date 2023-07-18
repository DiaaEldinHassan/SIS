import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      home: ThreeButtonToggle(),
    );
  }
}

class ThreeButtonToggle extends StatefulWidget {
  @override
  _ThreeButtonToggleState createState() => _ThreeButtonToggleState();
}

class _ThreeButtonToggleState extends State<ThreeButtonToggle> {
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('motor');
  List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Motor'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: screenHeight / 3),
              ToggleButtons(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(Icons.hdr_auto),
                        Container(
                            child: Image.asset(
                          'assets/images/automatic.png',
                          width: screenWidth / 10,
                        )),

                        Text('Auto',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(Icons.hdr_auto),
                        Container(
                            child: Image.asset(
                          'assets/images/light-bulb.png',
                          width: screenWidth / 10,
                        )),

                        Text('ON',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icon(Icons.hdr_auto),
                        Container(
                            child: Image.asset(
                          'assets/images/turned-off.png',
                          width: screenWidth / 10,
                        )),

                        Text('OFF',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ),
                ],
                isSelected: _selections,
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < _selections.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        _selections[buttonIndex] = true;
                      } else {
                        _selections[buttonIndex] = false;
                      }
                    }
                    if (index == 0) {
                      databaseReference.set(0);
                    } else if (index == 1) {
                      databaseReference.set(1);
                    } else {
                      databaseReference.set(2);
                    }
                  });
                },
                selectedColor: Colors.white,
                fillColor: Colors.green,
                borderRadius: BorderRadius.circular(10),
                borderWidth: 3,
                // Use the minimumSize property to adjust button size
                // You can adjust the width and height values to suit your needs

                constraints: BoxConstraints(
                  minWidth: screenHeight / 8,
                  minHeight: screenHeight / 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
