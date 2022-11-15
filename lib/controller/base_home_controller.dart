import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../data/models/task_type.dart';

abstract class BaseHomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final editTaskType = TextEditingController();
  late List<TaskType> tasks = <TaskType>[].obs;
  final chipIndex = 0.obs;
  final addTaskType = false.obs;
  final deletetaskType = false.obs;
  final updateTaskType = Get.arguments;

  Future<void> loadTaskTypes();

  Future<void> createTaskType(TaskType taskType);

  Future<void> deleteTaskType(TaskType taskType);

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  void changeAddTaskType(bool add) {
    addTaskType.value = add;
  }

  void changeDelete(bool delete) {
    deletetaskType.value = delete;
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