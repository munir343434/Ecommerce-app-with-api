// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double? size;
  TextOverflow overflow;
  SmallText({
    Key? key,
    this.color = const Color(0xffccc7c5),
    required this.text,
    this.size = 15,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(fontFamily: 'Roboto', fontSize: size, color: color),
    );
  }
}
