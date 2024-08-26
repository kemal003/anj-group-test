import 'package:anj_group/config/main_pages.dart';
import 'package:anj_group/config/main_route.dart';
import 'package:anj_group/services/dio_service.dart';
import 'package:anj_group/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID');

  await _initServices();

  runApp(const MyApp());
}

Future<void> _initServices() async {
  await Get.putAsync(() => HiveService().initHive());
  Get.put(DioService().initDio());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: MainPages.pages,
      initialRoute: MainRoute.home,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
