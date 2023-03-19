import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:reckon_farmyaar/provider/data.dart';
import 'package:reckon_farmyaar/utils/utils.dart';
import 'package:http/http.dart' as http;

class DashHome extends StatefulWidget {
  const DashHome({Key? key}) : super(key: key);

  @override
  State<DashHome> createState() => _DashHomeState();
}

class _DashHomeState extends State<DashHome> {
  bool _isLoading = true;
  bool switchval = true;
  String city = '';
  String currTemp = '';
  var senData = {};
  int deviceOn = -1;

  void getSenData() async {
    var url = Uri.parse('http://192.168.137.214:300/sensor');
    var response = await http.get(url);
    setState(() {
      senData = json.decode(response.body)['data'];
      print(senData);
      print('s');
    });
  }

  @override
  void initState() {
    getSenData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data(context, true).weatherData != null) {
      setState(() {
        _isLoading = false;
        city = data(context, false).city;
        currTemp = data(context, false).currTemp;
      });
    }
    print(city);
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                      color: Color(0xff2A2C28),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Color(0xff2A2C28),
                        ),
                        height: h(context) * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(city,
                                style: GoogleFonts.lexendDeca(
                                    color: Colors.white)),
                            SizedBox(width: 10),
                            Text(
                              currTemp,
                              style: GoogleFonts.lexendDeca(
                                  color: Colors.white, fontSize: 40),
                            ),
                          ],
                        ),
                      )),
                  Card(
                      color: Color(0xff2A2C28),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Color(0xff2A2C28),
                        ),
                        height: h(context) * 0.25,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(city, style: GoogleFonts.lexendDeca(color: Colors.white)),
                              // SizedBox(height: 10),
                              // Text(currTemp, style: GoogleFonts.lexendDeca(color: Colors.white)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.energy_savings_leaf_rounded,
                                          color: Color(0xffE79A56)),
                                      SizedBox(width: 10),
                                      Text(
                                        'Soil Sensors',
                                        style: GoogleFonts.lexendDeca(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),

                                  // Container(
                                  //   //width:20,
                                  //   height: 30,
                                  //   child: LiteRollingSwitch(
                                  //
                                  //     width: 80,
                                  //       onTap: (){},
                                  //       onDoubleTap: (){},
                                  //       onSwipe: (){},
                                  //       onChanged: (bool position){
                                  //
                                  //       },
                                  //       value: true,
                                  //       textOn: '',
                                  //       textOff: '',
                                  //       colorOn: Color(0xff1C9C74),
                                  //       colorOff: Color(0xffE2585D),
                                  //
                                  //   ),
                                  // ),
                                  Switch(
                                      value: switchval,
                                      activeColor: Color(0xff1C9C74),
                                      inactiveThumbColor: Color(0xffE2585D),
                                      inactiveTrackColor: Color(0xffE2585D),
                                      //key: key,
                                      onChanged: (value) {
                                        getBool();
                                        // var url = Uri.parse(
                                        //     'http://192.168.137.214:300/button-change');
                                        // var response = http.get(url);
                                        // print('x');
                                        // setState(() {
                                        //   switchval = value;
                                        // });
                                        // print(getBool());
                                        // setState(() {
                                        //   switchval = await getBool();
                                        // });
                                      }),
                                ],
                                // ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Temperature',
                                    style: GoogleFonts.lexendDeca(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: w(context) * 0.4,
                                    child: LinearPercentIndicator(
                                      barRadius: Radius.circular(5),
                                      backgroundColor: Color(0xff2A2C28),
                                      percent: senData['Temp'] != null
                                          ? senData['Temp'] / 100
                                          : 1,
                                      lineHeight: 10,
                                    ),
                                  ),
                                  Text(
                                    senData['Temp'] != null
                                        ? '${senData['Temp']}\u00B0C'
                                        : '100',
                                    style: GoogleFonts.lexendDeca(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Humidity',
                                    style: GoogleFonts.lexendDeca(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 24),
                                  Container(
                                    width: w(context) * 0.4,
                                    child: LinearPercentIndicator(
                                      barRadius: Radius.circular(5),
                                      backgroundColor: Color(0xff2A2C28),
                                      percent: senData['Hum'] != null
                                          ? senData['Hum'] / 100
                                          : 1,
                                      lineHeight: 10,
                                    ),
                                  ),
                                  Text(
                                    senData['Hum'] != null
                                        ? '${senData['Hum']}%'
                                        : '100',
                                    style: GoogleFonts.lexendDeca(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Moisture',
                                    style: GoogleFonts.lexendDeca(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 28),
                                  Container(
                                    width: w(context) * 0.4,
                                    child: LinearPercentIndicator(
                                      barRadius: Radius.circular(5),
                                      backgroundColor: Color(0xff2A2C28),
                                      percent: senData['Moi'] != null
                                          ? ((1024 -
                                                  double.parse(
                                                      senData['Moi'])) /
                                              1024)
                                          : 1,
                                      lineHeight: 10,
                                    ),
                                  ),
                                  Text(
                                    senData['Moi'] != null
                                        ? '${(((1024 - double.parse(senData['Moi'])) / 1024) * 100).toStringAsFixed(0)} % MC'
                                        : '100',
                                    style: GoogleFonts.lexendDeca(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Smoke',
                                    style: GoogleFonts.lexendDeca(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 39),
                                  Container(
                                    width: w(context) * 0.4,
                                    child: LinearPercentIndicator(
                                      barRadius: Radius.circular(5),
                                      backgroundColor: Color(0xff2A2C28),
                                      percent: senData['Smok'] != null
                                          ? (double.parse(senData['Smok'])) /
                                              2000
                                          : 1,
                                      lineHeight: 10,
                                    ),
                                  ),
                                  Text(
                                    senData['Smok'] != null
                                        ? '${double.parse(senData['Smok'])} ppm'
                                        : '100',
                                    style: GoogleFonts.lexendDeca(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                    children: [
                      GestureDetector(
                        child: Card(
                          color: deviceOn == 0
                              ? Color(0xff1C9C74)
                              : Color(0xff2A2C28),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.water_drop, color: Colors.white),
                                SizedBox(height: 9),
                                Text(
                                  "Motor",
                                  style: GoogleFonts.lexendDeca(
                                      color: Colors.white),
                                ),
                                Text(
                                  "Started",
                                  style: GoogleFonts.lexendDeca(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          if (deviceOn != 0) {
                            setState(() {
                              deviceOn = 0;
                            });
                          } else {
                            setState(() {
                              deviceOn = -1;
                            });
                          }
                          getBool();
                        },
                      ),
                      GestureDetector(
                        child: Card(
                          color: deviceOn == 1
                              ? Color(0xff1C9C74)
                              : Color(0xff2A2C28),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.air_rounded, color: Colors.white),
                                SizedBox(height: 9),
                                Text(
                                  "Perfectly",
                                  style: GoogleFonts.lexendDeca(
                                      color: Colors.white),
                                ),
                                Text(
                                  "Humid",
                                  style: GoogleFonts.lexendDeca(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          if (deviceOn != 1) {
                            setState(() {
                              deviceOn = 1;
                            });
                          } else {
                            setState(() {
                              deviceOn = -1;
                            });
                          }
                        },
                      ),
                      GestureDetector(
                        child: Card(
                          color: deviceOn == 2
                              ? Color(0xff1C9C74)
                              : Color(0xff2A2C28),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shower_rounded, color: Colors.white),
                                SizedBox(height: 9),
                                Text(
                                  "Stop",
                                  style: GoogleFonts.lexendDeca(
                                      color: Colors.white),
                                ),
                                Text(
                                  "Fertilizer",
                                  style: GoogleFonts.lexendDeca(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          if (deviceOn != 2) {
                            setState(() {
                              deviceOn = 2;
                            });
                          } else {
                            setState(() {
                              deviceOn = -1;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Color(0xff2A2C28),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.group,
                                size: 36,
                                color: Color(0xffE79A56),
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Community Ping',
                                style: GoogleFonts.lexendDeca(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '\u2022',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Community Ping',
                                style: GoogleFonts.lexendDeca(
                                    color: Colors.white, fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '\u2022',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Community Ping',
                                style: GoogleFonts.lexendDeca(
                                    color: Colors.white, fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '\u2022',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Community Ping',
                                style: GoogleFonts.lexendDeca(
                                    color: Colors.white, fontSize: 14),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  void getBool() async {
    print('x');
    var url = Uri.parse('http://192.168.137.214:300/button-change');
    var response = await http.get(url);
    print(response.statusCode);
    setState(() {
      switchval = json.decode(response.body)['status'];
    });
  }
}
