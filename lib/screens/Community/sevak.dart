import 'package:flutter/material.dart';

class SevakPage extends StatefulWidget {
  const SevakPage({Key? key}) : super(key: key);

  @override
  State<SevakPage> createState() => _SevakPageState();
}

class _SevakPageState extends State<SevakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff151413),
        body: Center(
          child: Text("Sevak Page",
            style: TextStyle(
                color: Colors.white
            ),
            // color: Colors.white),
          ),
        )
    );
  }
}
