import 'package:anj_group/config/main_route.dart';
import 'package:anj_group/modules/list_data/list_data_controller.dart';
import 'package:anj_group/utils/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDataScreen extends StatelessWidget {
  const ListDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Data'),
      ),
      body: GetBuilder<ListDataController>(
        builder: (controller) {
          return ListView.separated(
            padding: const EdgeInsets.all(40),
            itemBuilder: (_, index) => InkWell(
              onTap: () => Get.toNamed(
                MainRoute.imageViewer,
                arguments: controller.listData[index],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  controller.listData[index].timestmap?.formatDate() ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(
              color: Colors.grey,
            ),
            itemCount: controller.listData.length,
          );
        },
      ),
    );
  }
}
