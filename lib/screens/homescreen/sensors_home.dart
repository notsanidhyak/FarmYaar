import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SensorsHome extends StatefulWidget {
  const SensorsHome({Key? key}) : super(key: key);

  @override
  State<SensorsHome> createState() => _SensorsHomeState();
}

class _SensorsHomeState extends State<SensorsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: Center(
        child: Text(
          "SensorsHome",
          style: GoogleFonts.lexendDeca(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
