import 'package:get/get.dart';
import 'package:todo_list/controller/home_controller.dart';
import '../controller/home_repository_controller.dart';
import '../provider/home_provider.dart';
import '../service/Repository/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(homeRepoSitory: HomeRepoSitory(homeProvider: HomeProvider())));
  }

}