import 'package:ecommerce_app/misc/dimension.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final Color color;
  final Color background;
  final IconData iconData;
  final double size;
  final double iconsize;
  const AppIcon({
    Key? key,
    this.color = const Color(0xff756d54),
    this.background = const Color(0xfffcf4e4),
    required this.iconData,
    this.size = 40,
    this.iconsize=16,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: background,
      ),
      child: Icon(
        iconData,
        color: color,
        size: iconsize,
      ),
    );
  }
}
