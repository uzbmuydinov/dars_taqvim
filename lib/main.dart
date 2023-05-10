import 'package:app/db_helper/db_helper.dart';
import 'package:app/services/theme_service.dart';
import 'package:app/ui/home/sign_page.dart';
import 'package:app/ui/profile/home_page.dart';
import 'package:app/ui/home/lang_page.dart';
import 'package:app/ui/home/register_page.dart';
import 'package:app/ui/profile/table_page.dart';
import 'package:app/ui/navigation/navigation_page.dart';
import 'package:app/ui/profile/profile_page.dart';
import 'package:app/ui/home/splash_page.dart';
import 'package:app/ui/theme.dart';
import 'package:app/ui/home/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'services/di_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DIService.init();
  await GetStorage.init();
  await DBHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
        home:   const SplashPage(),
    );
  }
}

