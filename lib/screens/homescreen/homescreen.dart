import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:reckon_farmyaar/provider/data.dart';
import 'package:reckon_farmyaar/screens/homescreen/dash_home.dart';
import 'package:reckon_farmyaar/screens/homescreen/forecast_home.dart';
import '/screens/homescreen/sensors_home.dart';
import 'package:reckon_farmyaar/screens/homescreen/weather_home.dart';
import 'package:reckon_farmyaar/utils/utils.dart';
import 'package:reckon_farmyaar/widgets/homescreen/tab_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeIndex = 0;
  bool _isInit = true;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      await data(context, false).getLocation().then((value) async {
        await data(context, false).getWeather();
      });
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final List<Map<String, dynamic>> menus = [
      {'index': 1, 'icon': Icons.home_filled, 'title': "Home"},
      {'index': 2, 'icon': Icons.cloud_circle_rounded, 'title': "Weather"},
      {'index': 3, 'icon': Icons.sensors_rounded, 'title': "Broadcast"},
    ];
    final List<Widget> bodies = [
      DashHome(),
      WeatherHome(),
      ForecastHome(),
    ];
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Color(0xff151413),
    //       title: Text(getSalutation(),style: GoogleFonts.lexendDeca(
    //         color: Colors.white,
    //       ),),
    //       bottom: TabBar(
    //         tabs: [
    //           TabCard('Dash', _tabIndex),
    //           TabCard('Weather', _tabIndex),
    //           TabCard('Sensors', _tabIndex),
    //         ],
    //         indicator: null,
    //         onTap: (value) {
    //           setState(() {
    //             _tabIndex = value;
    //           });
    //         },
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [
    //         DashHome(),
    //         WeatherHome(),
    //         ForecastHome(),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getSalutation(),
                      style: GoogleFonts.lexendDeca(
                        color: Colors.white,
                        fontSize: 28,
                      )),
                  Icon(
                    Icons.circle_notifications_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 30),
              GNav(
                selectedIndex: _activeIndex,
                curve: Curves.easeInOutQuint,
                duration: const Duration(milliseconds: 300),
                haptic: true,
                gap: 8,
                tabMargin: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.white,
                activeColor: Color(0xff151413),
                textStyle: GoogleFonts.lexendDeca(
                  color: Color(0xff2A2C28),
                ),
                tabBackgroundColor: Color(0xffE79A56),
                onTabChange: (index) {
                  setState(() {
                    _activeIndex = index;

                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint,
                    );
                  });
                },
                tabs: menus
                    .map(
                      (menu) => GButton(
                        gap: 8,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        icon: menu['icon'],
                        text: menu['title'],
                        // textStyle: TextStyle(
                        //   color: Theme.of(context).primaryColor,
                        //   fontWeight: FontWeight.w600,
                        // ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              // Post
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                  itemCount: bodies.length,
                  itemBuilder: (ctx, index) => bodies[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getSalutation() {
    var now = DateTime.now();
    if (now.hour < 12) {
      return "Good morning";
    } else if (now.hour < 18) {
      return "Good afternoon";
    } else {
      return "Good evening";
    }
  }
}
