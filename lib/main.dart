import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_list/binding/home_binding.dart';
import 'package:todo_list/data/database/database.dart';
import 'package:todo_list/router/routers.dart';
import 'package:todo_list/ui/home_view/home.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseTaskType.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key?key}): super(key: key);

  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
    title: 'Todo list app',
    home: const Home(),
    initialBinding: HomeBinding(),
    builder: EasyLoading.init(),
    initialRoute: RouterNavigation.home,
    getPages:RouterNavigation.routers,
   );
  }
}