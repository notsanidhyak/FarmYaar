import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reckon_farmyaar/provider/data.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

double w(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double h(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Data data(BuildContext context, bool listen) {
  return Provider.of<Data>(context, listen: listen);
}
