import 'package:get/get.dart';
import 'package:todo_list/controller/home_controller.dart';
import 'package:todo_list/provider/home_provider.dart';
import 'package:todo_list/service/Repository/home_repository.dart';

class HomeSerVice extends GetxService {
    void initService() async{
      await Get.putAsync((() => HomeProvider().fetchData()));
    }
}