import 'package:flutter/material.dart';

double height(double height, BuildContext context) {
  return MediaQuery.of(context).size.height * height;
}

double width(double width, BuildContext context) {
  return MediaQuery.of(context).size.width * width;
}
