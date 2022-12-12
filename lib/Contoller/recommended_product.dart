import 'package:ecommerce_app/data/api/repository/popular_product_rep.dart';
import 'package:ecommerce_app/model/products_model.dart';
import 'package:get/get.dart';

import '../data/api/repository/recommended_product_rep.dart';

class RecommendProductController extends GetxController {
  final RecommendProductRepo recommendProductRepo;
  RecommendProductController({
    required this.recommendProductRepo,
  });
  List<ProductsModel> _recommendProductList = [];
  List<ProductsModel> get recommendProductList => _recommendProductList;
  bool _Loaded = false;
 bool get isLoaded => _Loaded;
  Future<void> getRecommendProductList() async {
    Response response = await recommendProductRepo.recommendProductList();
    if (response.statusCode == 200) {
      _recommendProductList = [];
      _recommendProductList.addAll(Product.fromJson(response.body).products);
      _Loaded = true;
      update();
    } else {
      print("got products");
    }
  }
}
