import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'govtnews.dart';
import 'latestnews.dart';
import 'localnews.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final List<Map<String, dynamic>> menus = [
      {'index': 1, 'icon': Icons.timer, 'title': "Latest"},
      {'index': 2, 'icon': Icons.assignment, 'title': "Government"},
      {'index': 3, 'icon': Icons.group, 'title': "Local"},
    ];
    final List<Widget> bodies = [
      LatestNews(),
      GovtNews(),
      LocalNews(),
    ];
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
                  Text("News Feed",
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
}
