import 'package:ecommerce_app/data/api/apiClient.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:get/get.dart';

class RecommendProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendProductRepo({
    required this.apiClient,
  });
    Future<Response>  recommendProductList()async{
   return await apiClient.getData(AppConstant.RECOMMENDED_PRODUCT_URI); 

  }
}
