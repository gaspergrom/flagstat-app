import 'package:flagstat_app/features/auth/views/AuthMain.dart';
import 'package:flagstat_app/shared/constants/FsColors.dart';
import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flagstat_app/shared/state/FsBindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: FsBindings(),
      theme: ThemeData(
        primaryColor: FsColors.primary,
        primarySwatch: FsColors.primarySwatch,
        unselectedWidgetColor: FsColors.grayLightSwatch,
        errorColor: FsColors.error,
      ),
      home: const AuthMain(),
      getPages: routes,
    );
  }
}
