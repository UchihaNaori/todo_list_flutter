import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_list/data/database/database.dart';
import 'package:todo_list/router/routers.dart';
import 'package:todo_list/service/Repository/home_repository.dart';
import '../data/models/task_type.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final editTaskType = TextEditingController();
  late List<TaskType> tasks = <TaskType>[].obs;
  final chipIndex = 0.obs;
  final addTaskType = false.obs;
  final showIconDelete = false.obs;
  HomeRepoSitory homeRepoSitory;
  HomeController({required this.homeRepoSitory});

  @override
  void onInit() {
    loadTaskTypes();
    super.onInit();
  }

  //Local server

  // Future<void> loadTaskTypes() async {
  //   tasks.assignAll(await homeRepoSitory.listTaskType());
  //   update();
  // }

  // Future<void> createTaskType(TaskType taskType) async {
  //   if (checkDuplicateTaskType(taskType)) {
  //     Response response =
  //         await homeRepoSitory.createTypeTask(taskType);
  //     addTaskType.value = true;

  //     if (response.statusCode == 200) {
  //       TaskType newTask = TaskType.fromJson(response.body);
  //       tasks.add(newTask);
  //       update();
  //     } else {
  //       throw Exception('Failed to load task type');
  //     }

  //   }
  // }

  // Future<void> deleteTaskType(TaskType taskType) async {
  //   Response response = await homeRepoSitory.deleteTaskType(taskType);

  //   if (response.statusCode == 200) {
  //     tasks.remove(taskType);
  //     update();
  //   } else {
  //     throw Exception('Failed to load task type');
  //   }
  // }


  //sqltite

  Future<void> loadTaskTypes() async {
    List responseJson  = await DataBaseTaskType.getTaskTypes();
    responseJson.map((m) => tasks.add(TaskType.fromJson(m))).toList();
    update();
  }

  Future<void> createTaskType(TaskType taskType) async{

    if (checkDuplicateTaskType(taskType)) {
      int id = await DataBaseTaskType.insertTaskType(taskType);
      addTaskType.value = true;

      if (id != 0) {
        taskType.id = id;
        tasks.add(taskType);
        update();
      } else {
        print('Error add');
      }
    }
  }

  Future<void> deleteTaskType(TaskType taskType) async{
    await DataBaseTaskType.deleteTaskType(taskType.id);
    tasks.remove(taskType);
    update();
  }

  Future<void> updateTaskType(TaskType taskType) async {
    var result = await Get.toNamed(RouterNavigation.editTask, arguments: taskType);

    if (result != null) {
      TaskType updateTaskType = result as TaskType;
      tasks = tasks.map((e) => e.id == updateTaskType.id ? updateTaskType : e).toList();
      update();
    }
  }

  void setChipIndex(int value) {
    chipIndex.value = value;
  }

  void setAddTaskType(bool value) {
    addTaskType.value = value;
  }

  void setShowIconDelete(bool value) {
    showIconDelete.value = value;
  }

  bool checkDuplicateTaskType(TaskType taskType) {
    if (tasks.contains(taskType)) {
      addTaskType.value = false;
      return false;
    }

    addTaskType.value = true;

    return true;
  }

  void updateListTaskType(TaskType taskType) async {
    tasks = tasks.map((e) => e.id == taskType.id ? taskType : e).toList();
    update();
  }

}
