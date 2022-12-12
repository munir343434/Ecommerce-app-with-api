import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class ExpandedText extends StatelessWidget {
  final String text;
  final double? size;
  final double? height;
  final Color? color;
  final int maxLines;
  const ExpandedText(
      {Key? key, required this.text, this.size, this.color, this.height,this.maxLines=4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text,
      style: TextStyle(fontSize: size, color: color, height: height),
      expandText: 'show more',
      collapseText: 'show less',
      maxLines: maxLines,
      linkColor: Colors.blue,
    );
  }
}
