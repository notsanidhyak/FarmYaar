import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:reckon_farmyaar/screens/Community/broadcast.dart';
import 'package:reckon_farmyaar/screens/Community/feed.dart';
import 'package:reckon_farmyaar/screens/Community/sevak.dart';
import 'package:reckon_farmyaar/screens/News/govtnews.dart';
import 'package:reckon_farmyaar/screens/News/latestnews.dart';
import 'package:reckon_farmyaar/screens/News/localnews.dart';
import 'package:reckon_farmyaar/screens/homescreen/dash_home.dart';
import 'package:reckon_farmyaar/screens/homescreen/forecast_home.dart';
import 'package:reckon_farmyaar/screens/homescreen/weather_home.dart';
import 'package:http/http.dart' as http;

import 'Community/Communitypg.dart';
import 'Dashhome.dart';
import 'Homescreen/homescreen.dart';
import 'News/Newspg.dart';
import 'Settingspg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  _DashboardState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton(
      "c95c63b34d562910701b888fa243168e2e956eca572e1d8b807a3e2338fdd0dc/stage",
      buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT,
    );

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }

  void _handleCommand(Map<String, dynamic> command) {
    switch (command["command"]) {
      case "Settings Page":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SettingsPage()));
        break;

      case "Dashboard Page":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const DashHome()));
        break;

      case "Weather Page":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WeatherHome()));
        break;

      case "Forecast Page":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ForecastHome()));
        break;

      case "Latest News Page":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LatestNews()));
        break;

      case "Government News Page":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const GovtNews()));
        break;

      case "Local News Page":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LocalNews()));
        break;

      case "Feed Page":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const FeedPage()));
        break;

      case "Help Page":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SevakPage()));
        break;

      // case "Feed Page":
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => const LocalNews()));
      //   break;

      case "Send message Page":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BroadcastPage()));
        break;

      case "Go Back":
        Navigator.pop(context);
        break;

      case "Start Motor":
        getBool();
        break;

      case "Switch off Motor":
        getBool();
        break;

      default:
        debugPrint("Unknown Command");
    }
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NewsPage(),
    CommunityPage(),
    SettingsPage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151413),
      // appBar: AppBar(
      //   title: Text('Bottom Navigation Bar Tutorial'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff151413),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color(0xffD9D9D9),
        selectedItemColor: Color(0xff1C9C74),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.space_dashboard_rounded,
                color: Color(0xff1C9C74),
              ),
              icon: Icon(
                Icons.space_dashboard_rounded,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper_rounded,
              ),
              label: "News"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.groups_rounded,
              ),
              label: "Community"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }

  void getBool() async {
    print('x');
    var url = Uri.parse('http://192.168.137.214:300/button-change');
    var response = await http.get(url);
    print(response.statusCode);
    setState(() {
      // switchval = json.decode(response.body)['status'];
    });
  }
}
