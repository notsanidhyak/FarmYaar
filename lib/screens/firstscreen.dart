import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reckon_farmyaar/provider/auth_provider.dart';
import 'package:reckon_farmyaar/screens/welcome_screen.dart';

import 'homescreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    EdgeInsets devicePadding = MediaQuery
        .of(context)
        .padding;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xff151413),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 130),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image(
                        image: AssetImage('assets/images/logo_login.png')
                    ),
                  ),
                  SizedBox(height: 170),
                  Text(
                    'Let us assist you as our token of appreciation',
                    style: GoogleFonts.lexendDeca(
                      color: Colors.white,
                      fontSize: 10,
                    )
                  ),
                  SizedBox(height: 30),
                  MyElevatedButton2(
                      onPressed: () {
                        ap.isSignedIn == true ? Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())) :
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                      },
                      child: Text(
                          'Get Started',
                          style: GoogleFonts.lexendDeca(
                            color: Colors.white,
                          )
                  ),
                  ),
                  // ElevatedButton(
                  //     onPressed: (){
                  //       ap.isSignedIn == true ? Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())) :
                  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
                  //       //Navigator.push(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()));
                  //     },
                  //       child: Text(
                  //       'Get Started',
                  //       style: GoogleFonts.lexendDeca(
                  //       color: Colors.white,
                  //       )
                  //   ),
                  // )
                ]
              ),
            )
          ),
        )
      ],
    );
  }
}

class MyElevatedButton2 extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  //final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton2({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    //this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return Container(
      width: 180,
      height: height,
      decoration: BoxDecoration(
        //gradient: gradient,
        borderRadius: borderRadius,
        color: Color(0xffE79A56),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
