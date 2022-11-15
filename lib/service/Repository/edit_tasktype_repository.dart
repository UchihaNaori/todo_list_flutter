import 'package:get/get.dart';
import 'package:todo_list/data/models/task_type.dart';
import 'package:todo_list/provider/edit_tasktype_provider.dart';

class EditTaskTypeRepository {
  EditTaskTypeProvider editTaskTypeProvider;
  EditTaskTypeRepository({required this.editTaskTypeProvider});

  Future<Response> updateTaskType(TaskType taskType) async {
    return await editTaskTypeProvider.updateTaskType(taskType.id, taskType.toJson());
  }
}