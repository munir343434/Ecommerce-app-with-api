// ignore_for_file: unnecessary_import, must_be_immutable, must_call_super

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/Contoller/popular_product_controller.dart';
import 'package:ecommerce_app/Contoller/recommended_product.dart';
import 'package:ecommerce_app/misc/AppColor.dart';
import 'package:ecommerce_app/misc/dimension.dart';
import 'package:ecommerce_app/model/products_model.dart';
import 'package:ecommerce_app/pages/Food/food_detail.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:ecommerce_app/widgets/app_column.dart';
import 'package:ecommerce_app/widgets/app_text.dart';
import 'package:ecommerce_app/widgets/largeText.dart';
import 'package:ecommerce_app/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currpage = 0.0;
  double scaleFactor = 0.8;
  double height = Dimensiom.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currpage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return popularProducts.isLoaded
            ? SizedBox(
                height: Dimensiom.pageView,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => FoodDetail());
                  },
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildPageItem(
                            index, popularProducts.popularProductList[index]);
                      }),
                ),
              )
            : const CircularProgressIndicator(
                color: AppColor.mainColor,
              );
      }),
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty
              ? 1
              : popularProducts.popularProductList.length,
          position: _currpage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        );
      }),
      SizedBox(
        height: Dimensiom.radius15,
      ),
      Container(
        padding: EdgeInsets.all(Dimensiom.radius15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LargeText(text: 'Popular'),
            Container(
              margin: EdgeInsets.only(left: Dimensiom.width15, bottom: 3),
              child: LargeText(text: '.'),
            ),
            SizedBox(
              width: Dimensiom.width15,
            ),
            SmallText(text: 'Food pairing'),
          ],
        ),
      ),
      GetBuilder<RecommendProductController>(
        builder: (recommededProducts) {
          return recommededProducts.isLoaded
              ? SizedBox(
                  width: 400,
                  height: 700,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recommededProducts.recommendProductList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              left: Dimensiom.radius15,
                              bottom: Dimensiom.height10),
                          child: Row(
                            children: [
                              //image section
                              Container(
                                width: Dimensiom.listViewImgSize,
                                height: Dimensiom.listViewImgSize,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensiom.radius20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            AppConstant.BASE_URI +
                                                AppConstant.imageFolder +
                                                recommededProducts
                                                    .recommendProductList[index]
                                                    .img!))),
                              ),
                              //text container
                              Expanded(
                                child: Container(
                                  height: Dimensiom.listViewTextContSize,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              Dimensiom.radius20),
                                          bottomRight: Radius.circular(
                                              Dimensiom.radius20))),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensiom.width10,
                                        top: Dimensiom.height10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LargeText(
                                            text: recommededProducts
                                                .recommendProductList[index]
                                                .name!),
                                        SizedBox(
                                          height: Dimensiom.height10,
                                        ),
                                        SmallText(
                                            text: recommededProducts
                                                .recommendProductList[index]
                                                .description!),
                                        SizedBox(
                                          height: Dimensiom.height10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        },
      )
    ]);
  }

  Widget buildPageItem(int index, ProductsModel popularProductList) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currpage.floor()) {
      double currScale = 1 - (_currpage - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currpage.floor() + 1) {
      var currScale = scaleFactor + (_currpage - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    } else if (index == _currpage.floor() - 1) {
      var currScale = 1 - (_currpage - index) * (1 - scaleFactor);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: Dimensiom.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensiom.width10, right: Dimensiom.width20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstant.BASE_URI +
                        AppConstant.imageFolder +
                        popularProductList.img!)),
                borderRadius: BorderRadius.circular(Dimensiom.radius30),
                color: const Color(0xff69c5df)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensiom.width30,
                  right: Dimensiom.width30,
                  bottom: Dimensiom.width30),
              height: Dimensiom.pageViewTextContainetr,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensiom.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5,
                        color: Color(0xffe8e8e8),
                        offset: Offset(0, 10)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensiom.height10,
                      left: Dimensiom.width15,
                      right: Dimensiom.width15),
                  child: Appcolumn(
                    text: popularProductList.name!,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
