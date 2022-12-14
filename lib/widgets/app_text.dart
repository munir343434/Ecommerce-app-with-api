import 'package:flutter/cupertino.dart';

class AppAndText extends StatelessWidget {
   final IconData icon;
  final String text;
   final Color iconColor;
  const AppAndText({
    Key? key,
    required this.icon,
    required this.text,
        required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,),
        Text(text),
              ],
    );
  }
}
