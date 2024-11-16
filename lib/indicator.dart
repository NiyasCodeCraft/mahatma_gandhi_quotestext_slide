import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {
  final bool isActive;

  const Indicator({super.key, required this.isActive});

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 400),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: widget.isActive ? 20 : 15,
      height: 10,
      decoration: BoxDecoration(
        color: widget.isActive ? Colors.teal : Colors.brown,
        borderRadius:BorderRadius.circular(8)
      ),
    );
  }
}
