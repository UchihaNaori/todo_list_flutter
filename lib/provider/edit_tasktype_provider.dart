import 'package:get/get.dart';

class EditTaskTypeProvider extends GetConnect {
  Future<Response> updateTaskType(id, data) => post('http://172.168.8.63:8000/api/updateTaskType/$id', data);
}