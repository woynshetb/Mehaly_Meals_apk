import 'package:flutter/material.dart';

class Catagory {
  // property of some entity
  final String id;
  final String title;
  final Color color;
  const Catagory(
      {@required this.id, @required this.title, this.color = Colors.orange});
}
