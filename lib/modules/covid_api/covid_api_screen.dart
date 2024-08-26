import 'package:anj_group/modules/covid_api/covid_api_controller.dart';
import 'package:anj_group/utils/datetime_extension.dart';
import 'package:anj_group/utils/int_extension.dart';
import 'package:anj_group/widgets/text_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CovidApiScreen extends StatelessWidget {
  const CovidApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covid-19 Data'),
      ),
      body: GetBuilder<CovidApiController>(
        builder: (controller) {
          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  controller.errorMessage,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (controller.covidData == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final covidData =
              controller.covidData?.features?.firstOrNull?.attributes;
          return Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                TextRow(
                  title: 'Confirmed',
                  value: (covidData?.confirmed ?? 0).toString(),
                ),
                10.verticalSpace(),
                TextRow(
                  title: 'Death',
                  value: (covidData?.deaths ?? 0).toString(),
                ),
                10.verticalSpace(),
                TextRow(
                  title: 'Recovered',
                  value: (covidData?.recovered ?? 0).toString(),
                ),
                10.verticalSpace(),
                TextRow(
                  title: 'Last Update',
                  value: (covidData?.lastUpdate ?? 0).formatDateUnix(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
