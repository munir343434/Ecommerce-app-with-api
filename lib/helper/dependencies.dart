import 'package:ecommerce_app/data/api/apiClient.dart';
import 'package:ecommerce_app/data/api/repository/popular_product_rep.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:get/get.dart';

import '../Contoller/popular_product_controller.dart';
import '../Contoller/recommended_product.dart';
import '../data/api/repository/recommended_product_rep.dart';

Future<void> init() async {
  // apiclient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URI));
// repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendProductRepo(apiClient: Get.find()));

  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendProductController(recommendProductRepo: Get.find()));

}
