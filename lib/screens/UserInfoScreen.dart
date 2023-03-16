import 'package:flutter/material.dart';
import 'package:alan_voice/alan_voice.dart';

import 'Communitypg.dart';
import 'Dashhome.dart';
import 'Newspg.dart';
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
    AlanVoice.addButton("c95c63b34d562910701b888fa243168e2e956eca572e1d8b807a3e2338fdd0dc/stage",
    buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT,
    );

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
    });
  }
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
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
              label: "Home"

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper_rounded,

            ),
            label: "News"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.groups_rounded,
            ),
              label: "Community"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
              label: "Settings"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
