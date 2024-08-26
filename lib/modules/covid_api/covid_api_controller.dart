import 'dart:developer';

import 'package:anj_group/models/covid_api_model.dart';
import 'package:anj_group/modules/covid_api/covid_api_repository.dart';
import 'package:get/get.dart';

class CovidApiController extends GetxController {
  static CovidApiController get to => Get.find();

  var errorMessage = '';
  CovidApiModel? covidData;

  Future<void> getData() async {
    try {
      covidData = await CovidApiRepository.getCovidData();
      update();
    } catch (e) {
      log('ERROR GET DATA COVID: $e');
      errorMessage = e.toString();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
