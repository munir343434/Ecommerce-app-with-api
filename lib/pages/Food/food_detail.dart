import 'package:ecommerce_app/Contoller/popular_product_controller.dart';
import 'package:ecommerce_app/misc/dimension.dart';
import 'package:ecommerce_app/widgets/app_column.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../misc/AppColor.dart';
import '../../widgets/largeText.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        //backgorund image
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: Dimensiom.detailImg,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/food.jpg'))),
          ),
        ),
        //icon widgrt
        Positioned(
          top: Dimensiom.height45,
          left: Dimensiom.width20,
          right: Dimensiom.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppIcon(iconData: Icons.arrow_back_ios),
              AppIcon(iconData: Icons.shopping_cart_outlined),
            ],
          ),
        ),
        //introduction 0f food
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimensiom.detailImg - 20,
          child: Container(
              padding: EdgeInsets.only(
                  left: Dimensiom.width20,
                  right: Dimensiom.width20,
                  top: Dimensiom.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensiom.radius20),
                      topLeft: Radius.circular(Dimensiom.radius20))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Appcolumn(
                      text: 'Biryani',
                      size: Dimensiom.font26,
                    ),
                    SizedBox(
                      height: Dimensiom.height20,
                    ),
                    LargeText(text: 'Introduce'),
                    SizedBox(
                      height: Dimensiom.height10,
                    ),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExpandedText(
                          text:
                              "This example shows a message that was posted by a user. The username is always visible right before the text and tapping on it opens the user profile. The text is truncated after two lines and can be expanded by tapping on the link show more at the end or the text itself. After the text was expanded it cannot be collapsed again as no collapseText was provided. URLs, @mentions and #hashtags in the text are styled differently and can be tapped to open the browser or the user profile.",
                          size: 16,
                          height: 1.8,
                          color: AppColor.paraColor,
                        ),
                      ),
                    )
                  ])),
        ),
      ]),
      bottomNavigationBar: Container(
        height: Dimensiom.bottomHeight,
        padding: EdgeInsets.only(
            left: Dimensiom.width20,
            right: Dimensiom.width20,
            top: Dimensiom.radius30,
            bottom: Dimensiom.height10),
        decoration: BoxDecoration(
            color: AppColor.buttonBcckgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensiom.radius20 * 2),
                topRight: Radius.circular(Dimensiom.radius20 * 2))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
                top: Dimensiom.height20,
                right: Dimensiom.width20,
                bottom: Dimensiom.height20,
                left: Dimensiom.width20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensiom.radius20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.remove,
                  color: AppColor.signColor,
                ),
                SizedBox(
                  width: Dimensiom.width10 / 2,
                ),
                LargeText(text: '0'),
                SizedBox(
                  width: Dimensiom.width10 / 2,
                ),
                Icon(
                  Icons.add,
                  color: AppColor.signColor,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: Dimensiom.height20,
                right: Dimensiom.width20,
                bottom: Dimensiom.height20,
                left: Dimensiom.width20),
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(Dimensiom.radius20)),
            child: LargeText(text: '"\$10 | Add to cart"'),
          )
        ]),
      ),
    );
  }
}
