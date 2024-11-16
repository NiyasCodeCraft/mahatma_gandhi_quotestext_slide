import 'package:flutter/material.dart';
import 'package:mahatma_gandhi_quotestext_slide/apptexts.dart';

class DisplayText extends StatefulWidget {
  final AppText appText;

  const DisplayText({super.key, required this.appText});

  @override
  State<DisplayText> createState() => _DisplayTextState();
}

class _DisplayTextState extends State<DisplayText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            textAlign: TextAlign.center,
            widget.appText.textPath,
            style: TextStyle(
                color: Colors.white, fontSize: 15,fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
