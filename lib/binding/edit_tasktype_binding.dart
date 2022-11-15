import 'package:get/get.dart';
import 'package:todo_list/provider/edit_tasktype_provider.dart';

import '../controller/edit_tasktype_controller.dart';
import '../service/Repository/edit_tasktype_repository.dart';

class EditTaskTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditTaskTypeController(editTaskTypeRepository: EditTaskTypeRepository(editTaskTypeProvider: EditTaskTypeProvider())));
  }

}