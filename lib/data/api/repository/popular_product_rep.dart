import 'package:ecommerce_app/data/api/apiClient.dart';
import 'package:ecommerce_app/utils/app_constant.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({
    required this.apiClient,
  });
    Future<Response>  PopularProductList()async{
   return await apiClient.getData(AppConstant.POPULAR_PRODUCT_URI); 

  }
}
