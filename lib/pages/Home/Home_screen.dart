// ignore_for_file: file_names

import 'package:ecommerce_app/misc/AppColor.dart';
import 'package:ecommerce_app/misc/dimension.dart';
import 'package:ecommerce_app/pages/Home/food_page.dart';
import 'package:ecommerce_app/widgets/largeText.dart';
import 'package:ecommerce_app/widgets/smallText.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(Dimensiom.radius15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(
                        text: 'Pakistan',
                        color: AppColor.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "   Islmabad",
                            size: 15,
                            color: Colors.black54,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: Dimensiom.width45,
                    height: Dimensiom.height45,
                    decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensiom.radius15)),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const Expanded(
                child: SingleChildScrollView(
              child: FoodPageBody(),
            ))
          ],
        ),
      ),
    );
  }
}
