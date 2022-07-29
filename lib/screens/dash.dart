import 'package:flutter/material.dart';

class DashPage extends StatelessWidget {
  const DashPage({Key? key}) : super(key: key);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Index 0: Dash',
      style: optionStyle,
    );
  }
}