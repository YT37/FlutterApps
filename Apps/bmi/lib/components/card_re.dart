import 'package:flutter/material.dart';

class CardRe extends StatelessWidget {
  final Color bg;
  final Widget cardChild;
  final Function onPress;

  CardRe({
    @required this.bg,
    this.cardChild,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
