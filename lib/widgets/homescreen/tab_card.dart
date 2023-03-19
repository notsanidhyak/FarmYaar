import 'package:flutter/material.dart';
import 'package:reckon_farmyaar/utils/utils.dart';

class TabCard extends StatelessWidget {
  final String text;
  final int index;
  const TabCard(this.text, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: getColor(),
        ),
        width: w(context) * .4,
        child: Tab(
          text: text,
        ),
      ),
    );
  }

  Color getColor() {
    if (text == 'Dash' && index == 0) {
      return Colors.amber;
    } else if (text == 'Weather' && index == 1) {
      return Colors.amber;
    } else if (text == 'Sensors' && index == 2) {
      return Colors.amber;
    } else {
      return Colors.white;
    }
  }
}
