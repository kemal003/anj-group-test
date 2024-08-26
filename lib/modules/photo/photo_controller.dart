import 'dart:developer';
import 'dart:io';

import 'package:anj_group/models/photo_model.dart';
import 'package:anj_group/services/hive_service.dart';
import 'package:anj_group/utils/datetime_extension.dart';
import 'package:anj_group/utils/dialog_helper.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PhotoController extends GetxController {
  static PhotoController get to => Get.find();

  late CameraController cameraController;
  var errorMessage = '';
  var isInit = false;
  late VoidCallback retryHandler;
  late Directory documentPath;

  Future<void> initCamera() async {
    try {
      isInit = false;
      final availableCamera = await availableCameras();
      if (availableCamera.isEmpty) {
        errorMessage = 'camera Not Available';
        return;
      }

      final primaryCamera = availableCamera.firstWhereOrNull(
          (camera) => camera.lensDirection == CameraLensDirection.back);

      cameraController = CameraController(
        primaryCamera ?? availableCamera.first,
        ResolutionPreset.max,
        enableAudio: false,
      );
      await cameraController.initialize();
      await requestLocation();

      isInit = true;
      update();
    } on CameraException catch (e) {
      log('INIT CAMERA FAILED: $e');
      errorMessage = e.description ?? 'Camera Access Not Available';
      isInit = false;
      update();
    }
  }

  Future<void> handleCameraPermission() async {
    final cameraPermission = await Permission.camera.request();
    if (cameraPermission.isPermanentlyDenied || cameraPermission.isDenied) {
      errorMessage = 'Camera Permission Denied';
      openAppSettings();
      update();
      return;
    }

    if (cameraPermission.isGranted) {
      errorMessage = '';
      initCamera();
    }
  }

  Future<void> requestLocation() async {
    final locationPermission = await Geolocator.requestPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      errorMessage = 'Location permission is denied';
      retryHandler = requestLocation;
      update();
      return;
    }

    final locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationServiceEnabled) {
      errorMessage = 'Location is not enabled';
      retryHandler = requestLocation;
      update();
      return;
    }
  }

  Future<void> takePhoto() async {
    try {
      if (cameraController.value.isTakingPicture) return;

      DialogHelper.showGlobalLoading();

      final takenPicture = await cameraController.takePicture();
      final currentPosition = await Geolocator.getCurrentPosition();

      final path =
          '${documentPath.path}/photo-${DateTime.now().formatDateForFile()}.jpg';
      await takenPicture.saveTo(path);

      final photo = PhotoModel()
        ..photoPath = path
        ..timestmap = DateTime.now()
        ..lat = currentPosition.latitude
        ..long = currentPosition.longitude;
      HiveService.photoBox.add(photo);
      Get.back();
      await DialogHelper.showGeneralDialog('Photo Saved');
    } catch (e) {
      log('TAKE PHOTO FAILED: $e');
    }
  }

  @override
  void onInit() async {
    super.onInit();
    documentPath = await getApplicationDocumentsDirectory();
    retryHandler = handleCameraPermission;
    initCamera();
  }

  @override
  void onClose() {
    super.onClose();
    if (isInit) cameraController.dispose();
  }
}
