import 'package:ecommerce_app/data/api/repository/popular_product_rep.dart';
import 'package:ecommerce_app/model/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({
    required this.popularProductRepo,
  });
  List<ProductsModel> _popularProductList = [];
  List<ProductsModel> get popularProductList => _popularProductList;
  bool _Loaded = false;
 bool get isLoaded => _Loaded;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.PopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _Loaded = true;
      update();
    } else {
      print("got products");
    }
  }
}
