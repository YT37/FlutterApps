import 'package:flutter/material.dart';

const labelText = TextStyle(fontSize: 18, color: Color(0xff8d8e98));

class IconName extends StatelessWidget {
  final String nameText;
  final IconData icon;

  IconName({required this.icon, required this.nameText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        SizedBox(height: 15),
        Text(nameText, style: labelText)
      ],
    );
  }
}
