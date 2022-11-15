import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

import '../data/models/task_type.dart';

class HomeProvider extends GetConnect{
  final List<TaskType> tasks = <TaskType>[].obs;

  Future<List<TaskType>> fetchData() async {
    final response = await http
        .get(Uri.parse('http://172.168.8.63:8000/api/listTaskType'));

    if (response.statusCode == 200) {
      List responseJson  = jsonDecode(response.body);
      responseJson.map((m) => tasks.add(TaskType.fromJson(m))).toList();
      return tasks;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<http.Response> getData() async{
    return await http.get(Uri.parse('http://172.168.8.63:8000/api/listTaskType'));
  }

  Future<Response> postTaskType (data) => post('http://172.168.8.63:8000/api/createTaskType', data);
  Future<Response> deleteTaskType (TaskType taskType) => get('http://172.168.8.63:8000/api/deleteTaskType/${taskType.id}');

}
