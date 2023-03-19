import 'package:flutter/material.dart';

class GovtNews extends StatefulWidget {
  const GovtNews({Key? key}) : super(key: key);

  @override
  State<GovtNews> createState() => _GovtNewsState();
}

class _GovtNewsState extends State<GovtNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff151413),
        body: Center(
          child: Text("Government News",
            style: TextStyle(
                color: Colors.white
            ),
            // color: Colors.white),
          ),
        )
    );
  }
}
