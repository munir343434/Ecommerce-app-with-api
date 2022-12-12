// ignore_for_file: file_names

import 'package:ecommerce_app/misc/dimension.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class LargeText extends StatelessWidget {
  final Color? color;
  final String text;
  double? size;
  TextOverflow overflow;
  LargeText({
    Key? key,
    this.color,
    this.size = 0,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize: size == 0 ? Dimensiom.font20 : size),
    );
  }
}
