import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: Center(
        child: Text(
          "DashHome",
          style: GoogleFonts.lexendDeca(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
