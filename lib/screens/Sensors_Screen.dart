import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final databaseReference = FirebaseDatabase.instance.ref().child('Sensors');

class SensorScreen extends StatefulWidget {
  SensorScreen({super.key});

  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: databaseReference.onValue,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final sensor1Data =
                snapshot.data.snapshot.value['Soil Mouisture'].toString();
            final sensor2Data =
                snapshot.data.snapshot.value['WaterLevel'].toString();
            final sensor3Data =
                snapshot.data.snapshot.value['Humidity'].toString();
                final sensor4Data =
                snapshot.data.snapshot.value['Temprature'].toString();
            // Do something with the sensor data here

            return Scaffold(
              backgroundColor: Color.fromARGB(255, 179, 178, 178),
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Text('Sensor Readings'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 25.0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/1692416-200.png',
                                    width: 40,
                                  ),
                                  Text(' Soil Moisture:',
                                      style: TextStyle(fontSize: 24.0)),
                                ],
                              ),
                              Text(sensor1Data,
                                  style: TextStyle(fontSize: 48.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      width: 40,
                                      'assets/images/Thermometer_icon.png'),
                                  Text('Temperature:',
                                      style: TextStyle(fontSize: 24.0)),
                                ],
                              ),
                              Text('$sensor4Data°C',
                                  style: TextStyle(
                                      color: Color(0xffEF5350),
                                      fontSize: 48.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                        width: 40, 'assets/images/11.png'),
                                  ),
                                  Text('Humidity:',
                                      style: TextStyle(fontSize: 24.0)),
                                ],
                              ),
                              Text('$sensor3Data%', style: TextStyle(fontSize: 48.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      width: 40, 'assets/images/5035756.png'),
                                  Text(' Water Level:',
                                      style: TextStyle(fontSize: 24.0)),
                                ],
                              ),
                              Text(sensor2Data,
                                  style: TextStyle(fontSize: 48.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Sensor readings'),
                backgroundColor: Colors.green,
              ),
              body: Center(
                  child: Text(
                'Loading...',
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.bold),
              )),
            );
          }
        });
  }
}
