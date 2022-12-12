import 'package:ecommerce_app/widgets/smallText.dart';
import 'package:flutter/material.dart';
import '../misc/AppColor.dart';
import '../misc/dimension.dart';
import 'app_text.dart';
import 'largeText.dart';

class Appcolumn extends StatelessWidget {
  final String text;
  final double? size;
  const Appcolumn({Key? key, required this.text, this.size=0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LargeText(text: text,size: size,),
        SizedBox(
          height: Dimensiom.height10,
        ),
        Row(children: [
          Wrap(
            children: List.generate(
                5,
                (index) => const Icon(
                      Icons.star,
                      color: AppColor.mainColor,
                      size: 15,
                    )),
          ),
          SizedBox(
            width: Dimensiom.width10,
          ),
          SmallText(
            text: '4.5',
          ),
          SizedBox(
            width: Dimensiom.width10,
          ),
          SmallText(
            text: '1287',
          ),
          SizedBox(
            width: Dimensiom.width10,
          ),
          SmallText(
            text: 'Comments',
          )
        ]),
        SizedBox(
          height: Dimensiom.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            AppAndText(
                text: '  Normal',
                icon: Icons.circle_sharp,
                iconColor: AppColor.iconColor1),
            AppAndText(
                text: '  1.7km',
                icon: Icons.location_on,
                iconColor: AppColor.mainColor),
            AppAndText(
                text: '  32min',
                icon: Icons.access_time_rounded,
                iconColor: AppColor.iconColor2),
          ],
        )
      ],
    );
  }
}
