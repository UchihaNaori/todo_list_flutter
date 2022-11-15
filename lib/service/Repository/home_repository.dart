import 'package:get/get_connect/http/src/response/response.dart';
import 'package:todo_list/provider/home_provider.dart';
import '../../data/models/task_type.dart';
import 'package:http/http.dart' as http;

class HomeRepoSitory {
  HomeProvider homeProvider;
  HomeRepoSitory({required this.homeProvider});
  Future<http.Response> getList() => homeProvider.getData();
  Future<List<TaskType>> listTaskType() => homeProvider.fetchData();
  Future<Response> createTypeTask(TaskType taskType) async{
    return homeProvider.postTaskType(taskType.toJson());
  }
  Future<Response> deleteTaskType(TaskType taskType) async {
    return await homeProvider.deleteTaskType(taskType);
  }
}