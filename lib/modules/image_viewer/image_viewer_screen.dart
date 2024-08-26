import 'dart:io';

import 'package:anj_group/modules/image_viewer/image_viewer_controller.dart';
import 'package:anj_group/utils/datetime_extension.dart';
import 'package:anj_group/utils/int_extension.dart';
import 'package:flutter/material.dart';

class ImageViewerScreen extends StatelessWidget {
  const ImageViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ImageViewerController.to.selectedData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              File(data.photoPath ?? ''),
              width: double.infinity,
            ),
            20.verticalSpace(),
            Text(
              data.timestmap?.formatDate() ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            10.verticalSpace(),
            Text(
              '${data.lat?.toStringAsFixed(3)}, ${data.long?.toStringAsFixed(3)}',
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
