import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:reckon_farmyaar/utils/utils.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  bool _isLoading = true;
  String city = '';
  String currTemp = '';
  dynamic loadedData = {};

  @override
  Widget build(BuildContext context) {
    if (data(context, true).weatherData != null) {
      setState(() {
        _isLoading = false;
        city = data(context, false).city;
        currTemp = data(context, false).currTemp;
        loadedData = data(context, false).weatherData['current'];
        print(data(context, false).weatherData['alerts']);
      });
    }
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    SizedBox(height: 12),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Color(0xffE2585D),
                          ),
                          height: h(context) * 0.2,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Alerts',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              data(context, false).weatherData['alerts'] == null
                                  ? const Center(child: Text('No alerts'))
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: data(context, false)
                                          .weatherData['alerts']
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                'Event $index: ${data(context, false).weatherData['alerts'][index]['event']}'),
                                            Text(
                                                'Start Time : ${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(data(context, false).weatherData['alerts'][index]['start'] * 1000))}'),
                                            Text(
                                                'End Time: ${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(data(context, false).weatherData['alerts'][index]['end'] * 1000))}'),
                                            Text(
                                                'Description: ${data(context, false).weatherData['alerts'][index]['description']}'),
                                          ],
                                        );
                                      },
                                    ),
                            ],
                          )),
                    ),
                    SizedBox(height: 15),
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
                        GridCard(
                            value: (loadedData['humidity']).toString(),
                            unit: '%',
                            title: 'Humidity'),
                        GridCard(
                            value: (loadedData['uvi']).toStringAsFixed(0),
                            unit: '',
                            title: 'UV Index'),
                        GridCard(
                            value: (loadedData['pressure']).toStringAsFixed(0),
                            unit: 'hPa',
                            title: 'Pressure'),
                        GridCard(
                            value: (loadedData['clouds']).toStringAsFixed(0),
                            unit: '%',
                            title: 'Clouds'),
                        GridCard(
                            value:
                                (loadedData['wind_speed']).toStringAsFixed(0),
                            unit:
                                '${getWindDirec(loadedData['wind_deg'])}\nKm/h',
                            title: 'Wind Speed'),
                        GridCard(
                            value: (loadedData['visibility'] / 1000)
                                .toStringAsFixed(0),
                            unit: 'm',
                            title: 'Visibility'),
                      ],
                    ),
                    SizedBox(height: 15),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Color(0xff2A2C28),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Color(0xff2A2C28),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Sunrise ',
                                style: GoogleFonts.lexendDeca(
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        '${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(loadedData['sunrise']))}',
                                    style: GoogleFonts.lexendDeca(
                                      color: Color(0xffE79A56),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Sunset ',
                                style: GoogleFonts.lexendDeca(
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        '${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(loadedData['sunset']))}',
                                    style: GoogleFonts.lexendDeca(
                                      color: Color(0xffE79A56),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Card(
                      color: Color(0xff2A2C28),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Color(0xff2A2C28),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${((data(context, false).weatherData['daily'][0]['temp']['max']) - 273.15).toStringAsFixed(0)}\u00B0C / ${((data(context, false).weatherData['daily'][0]['temp']['min']) - 273.15).toStringAsFixed(0)}\u00B0C',
                              style: GoogleFonts.lexendDeca(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: w(context) * 0.05,
                            ),
                            Text(
                              'Tommorow',
                              style: GoogleFonts.lexendDeca(
                                fontSize: 12,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  String getWindDirec(int windDirec) {
    List directions = ['N', 'NE', 'E', 'SE', 'S', 'Sw', 'W', 'NW'];
    int index = (windDirec / 45).round() % 8;
    return directions[index];
  }
}

class GridCard extends StatelessWidget {
  final String value;
  final String unit;
  final String title;
  const GridCard(
      {Key? key, required this.value, required this.unit, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff2A2C28),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff2A2C28),
          borderRadius: BorderRadius.circular(15),
        ),
        height: h(context) * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: GoogleFonts.lexendDeca(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 5),
                Text(unit,
                    style: GoogleFonts.lexendDeca(
                        color: Colors.white, fontSize: 12)),
              ],
            ),
            SizedBox(height: 5),
            Text(title, style: GoogleFonts.lexendDeca(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
