import 'package:anj_group/config/main_route.dart';
import 'package:anj_group/constant/asset_const.dart';
import 'package:anj_group/utils/int_extension.dart';
import 'package:anj_group/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(AssetConst.logoAnjGroup),
              30.verticalSpace(),
              MainButton(
                label: 'Take a Photo',
                onTap: () => Get.toNamed(MainRoute.photo),
              ),
              30.verticalSpace(),
              MainButton(
                label: 'List Data',
                onTap: () => Get.toNamed(MainRoute.listData),
              ),
              30.verticalSpace(),
              MainButton(
                label: 'API Covid-19',
                onTap: () => Get.toNamed(MainRoute.covidApi),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
