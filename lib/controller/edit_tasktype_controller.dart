import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/data/database/database.dart';
import 'package:todo_list/data/models/task_type.dart';
import 'package:todo_list/service/Repository/edit_tasktype_repository.dart';

class EditTaskTypeController extends GetxController {
  EditTaskTypeRepository editTaskTypeRepository;
  final formKey = GlobalKey<FormState>();
  Rx<TaskType> _editTask  = TaskType(id: 0, title: '', icon: 0, color: '').obs;
  final title = TextEditingController();
  EditTaskTypeController({required this.editTaskTypeRepository});
  final taskType = Get.arguments as TaskType;

  @override
  void onInit() {
    _editTask.value = taskType;
    title.text = taskType.title;
    super.onInit();
  }

  void setIcon(int iconCode, String color) {
    _editTask.value.icon = iconCode;
    _editTask.value.color = color;
    update();
  }

  //Local server

  // Future<void> updateTaskType() async {
  //   _editTask.value.title = title.text;
  //   final response = await editTaskTypeRepository.updateTaskType(_editTask.value);

  //   if (response.statusCode == 200) {
  //     Get.back(result: _editTask.value);
  //   } else {
  //     print('Error load');
  //   }
  // }

  //sqlite

  Future<void> updateTaskType() async {
    _editTask.value.title = title.text;
    int responseUpdate = await DataBaseTaskType.updateTaskType(_editTask.value);

    if (responseUpdate != 0) {
      Get.back(result: _editTask.value);
    }
  }
}