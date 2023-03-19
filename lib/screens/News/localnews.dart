import 'package:flutter/material.dart';

class LocalNews extends StatefulWidget {
  const LocalNews({Key? key}) : super(key: key);

  @override
  State<LocalNews> createState() => _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: Center(
        child: Text("Local News",
        style: TextStyle(
          color: Colors.white
          ),
        // color: Colors.white),
        ),
        )
    );
  }
}
