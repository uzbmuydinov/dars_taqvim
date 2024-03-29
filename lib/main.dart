import 'package:app/db_helper/db_helper.dart';
import 'package:app/models/user_model.dart';
import 'package:app/services/lang_service.dart';
import 'package:app/services/theme_service.dart';
import 'package:app/ui/home/register_page.dart';
import 'package:app/ui/home/sign_page.dart';

import 'package:app/ui/home/splash_page.dart';
import 'package:app/ui/home/translations.dart';
import 'package:app/ui/profile/planning_page.dart';
import 'package:app/ui/theme.dart';
import 'package:app/ui/home/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';

import 'services/di_service.dart';
import 'services/hive_db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveService.dbName);
  await Hive.openBox(HiveService.langId);
  await DIService.init();
  await GetStorage.init();
  await DBHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget startPage() {
    List<UserModel> user = [];
    user = HiveService.readUsers();
    if (user.isNotEmpty) {
      return const SignInPage();
    } else {
      return const RegisterPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: LangService.locale,
      fallbackLocale: LangService.fallbackLocale,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: const SplashPage(),
    );
  }
}
class ChangeLang extends StatelessWidget {
  const ChangeLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Changed".tr),
      ),
      body: Column(
        children: [
          MaterialButton(onPressed: (){
            LangService().changeLocale('ru');
          },child: const Text('RUSSIAN'),),
          MaterialButton(onPressed: (){
            LangService().changeLocale('uz');
          },child: const Text('UZBEK'),),
        ],
      ),
    );
  }
}
