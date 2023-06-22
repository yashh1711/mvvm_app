import 'package:mvvm_app/data/network/base_api_services.dart';
import 'package:mvvm_app/data/network/network_api_services.dart';
import 'package:mvvm_app/res/app_urls.dart';

class AuthRepository {
  final BaseaApiService _baseaApiService = NetworkApiService();

  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response =
          await _baseaApiService.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUp(dynamic data) async {
    try {
      dynamic response =
          await _baseaApiService.getPostApiResponse(AppUrls.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
