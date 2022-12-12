// ignore_for_file: file_names, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:ecommerce_app/misc/AppColor.dart';
import 'package:ecommerce_app/misc/dimension.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/expandable_text.dart';
import 'package:ecommerce_app/widgets/largeText.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(iconData: Icons.clear),
                AppIcon(iconData: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensiom.radius20),
                      topRight: Radius.circular(Dimensiom.radius20),
                    )),
                child: Center(
                  child: LargeText(text: 'Chineese Side'),
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 10),
              ),
            ),
            pinned: true,
            backgroundColor: const Color.fromARGB(255, 198, 134, 31),
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/food.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensiom.width20, right: Dimensiom.width20),
              child: ExpandedText(
                text:
                    " A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.Paragraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.Paragraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence.",
                height: 1.8,
                maxLines: 10,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensiom.width20 * 2,
                right: Dimensiom.width20 * 2,
                top: Dimensiom.height10,
                bottom: Dimensiom.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppIcon(
                    background: AppColor.mainColor,
                    iconsize: 30,
                    color: Colors.white,
                    iconData: Icons.remove),
                LargeText(
                  text: '\$12.88' + 'X' + '0',
                  color: AppColor.mainBlackColor,
                  size: Dimensiom.font26,
                ),
                const AppIcon(
                    background: AppColor.mainColor,
                    iconsize: 30,
                    color: Colors.white,
                    iconData: Icons.add),
              ],
            ),
          ),
          Container(
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColor.mainColor,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensiom.height20,
                        right: Dimensiom.width20,
                        bottom: Dimensiom.height20,
                        left: Dimensiom.width20),
                    decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensiom.radius20)),
                    child: LargeText(text: '"\$10 | Add to cart"'),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
