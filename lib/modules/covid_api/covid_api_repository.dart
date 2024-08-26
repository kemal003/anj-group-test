import 'package:anj_group/constant/api_const.dart';
import 'package:anj_group/models/covid_api_model.dart';
import 'package:anj_group/services/dio_service.dart';
import 'package:dio/dio.dart';

class CovidApiRepository {
  static Future<CovidApiModel> getCovidData() async {
    try {
      final response = await DioService.dio.get(ApiConst.covidUrl);
      return CovidApiModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}
