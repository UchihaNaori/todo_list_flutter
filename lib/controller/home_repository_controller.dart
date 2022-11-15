import 'package:get/get.dart';
import 'package:todo_list/controller/base_home_controller.dart';
import 'package:todo_list/data/models/task_type.dart';
import 'package:todo_list/provider/home_provider.dart';
import 'package:todo_list/service/Repository/home_repository.dart';

class HomeRepositoryController extends BaseHomeController {
  HomeRepoSitory homeRepoSitory;
  HomeRepositoryController({required this.homeRepoSitory});

  @override
  void onInit() {
    loadTaskTypes();
    super.onInit();
  }

  @override
  Future<void> createTaskType(TaskType taskType) async{
    if (checkDuplicateTaskType(taskType)) {
      Response response =
          await homeRepoSitory.createTypeTask(taskType);
      addTaskType.value = true;
      if (response.statusCode == 200) {
        tasks.add(taskType);
      } else {
        throw Exception('Failed to load task type');
      }

    }
  }

  @override
  Future<void> deleteTaskType(TaskType taskType) async {
     Response response = await homeRepoSitory.deleteTaskType(taskType);

    if (response.statusCode == 200) {
      tasks.remove(taskType);
    } else {
      throw Exception('Failed to load task type');
    }
  }

  @override
  Future<void> loadTaskTypes() async {
    tasks.assignAll(await homeRepoSitory.listTaskType());
  }

}