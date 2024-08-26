import 'package:anj_group/modules/photo/photo_controller.dart';
import 'package:anj_group/utils/int_extension.dart';
import 'package:anj_group/widgets/main_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Photo'),
      ),
      body: GetBuilder<PhotoController>(
        builder: (controller) {
          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.errorMessage),
                    20.verticalSpace(),
                    MainButton(
                      label: 'Retry',
                      onTap: controller.retryHandler,
                    ),
                  ],
                ),
              ),
            );
          }

          if (!controller.isInit) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  20.verticalSpace(),
                  const Text('Camera loading...'),
                ],
              ),
            );
          }

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Builder(
                builder: (context) {
                  var camera = controller.cameraController.value;
                  final size = MediaQuery.of(context).size;
                  var scale = size.aspectRatio * camera.aspectRatio;

                  if (scale < 1) scale = 1 / scale;

                  return Transform.scale(
                    scale: scale,
                    child: Center(
                      child: CameraPreview(controller.cameraController),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: MainButton(
                  label: 'Save',
                  onTap: controller.takePhoto,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
