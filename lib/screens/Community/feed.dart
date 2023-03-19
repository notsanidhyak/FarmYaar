import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff151413),
        body: Center(
          child: Text("Feed Page",
            style: TextStyle(
                color: Colors.white
            ),
            // color: Colors.white),
          ),
        )
    );
  }
}
