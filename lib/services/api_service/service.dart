import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:intertoons/screens/fullview/model/detail_model.dart';
import 'package:intertoons/screens/home/model/bannermodel/home_model.dart';
import 'package:intertoons/screens/home/model/featuredmodel/model.dart';
import 'package:intertoons/services/api_service/endpoints/endpoints.dart';

class ApiService extends Endpoints {
//===================fetching==Home==Banner=Images==============//
  Future<Data?> getHomeProducts() async {
    try {
      final response = await Dio().get("$baseUrl/Products/HomeProducts");

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final allResponse = AllProductModel.fromJson(response.data);
        log(allResponse.data.mobileMainBanners[0].imageUrl.toString());
        return allResponse.data;
      }
      return null;
    } on DioError catch (e) {
      log(e.message);
      return null;
    }
  }

//===================fetching==Featured==products===============//

  Future<FeaturedModel?> getFeaturedProduct() async {
    try {
      final response = await Dio().get(
          "$baseUrl/FeaturedProduct?custId=%27%27&guestId=%27%27",
          options: Options(headers: {"vendorUrlKey": "kmshoppy"}));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return FeaturedModel.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      log(e.message);
      return null;
    }
  }

  //============get==product==details============//

  Future<DetailsModel?> getProductDeatils(String productUrl) async {
    try {
      final response = await Dio().get(
          "$baseUrl/ProductDetails?urlKey=$productUrl&custId=''&guestId=4653631114&pincode='kmshoppy'&ve ndorUrlKey='kmshoppy'",
          options: Options(headers: {"vendorUrlKey": "kmshoppy"}));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return DetailsModel.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      log(e.message);
      return null;
    }
  }
}
