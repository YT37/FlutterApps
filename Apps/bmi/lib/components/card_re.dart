import 'package:flutter/material.dart';

class CardRe extends StatelessWidget {
  final Color bg;
  final Widget cardChild;
  final void Function()? onPressed;

  CardRe({
    required this.bg,
    required this.cardChild,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
