import 'package:anj_group/utils/int_extension.dart';
import 'package:anj_group/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showGlobalLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
    Get.dialog(
      const Center(
        child: PopScope(
          canPop: false,
          child: CircularProgressIndicator(),
        ),
      ),
      barrierDismissible: false,
      name: "GLOBAL LOADING",
    );
  }

  static Future<void> showGeneralDialog(
    String title, {
    VoidCallback? onTap,
  }) async {
    await Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          10.verticalSpace(),
          MainButton(
            label: 'OK',
            onTap: onTap ?? () => Get.back(),
          ),
        ],
      ),
    );
  }
}
