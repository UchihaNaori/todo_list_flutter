import 'package:get/get.dart';
import 'package:todo_list/binding/edit_tasktype_binding.dart';
import 'package:todo_list/binding/home_binding.dart';
import 'package:todo_list/ui/edit_task/edit_task.dart';
import 'package:todo_list/ui/home_view/home.dart';


class RouterNavigation {
  static String home = '/';
  static String editTask = '/addTask';

  static List<GetPage> routers = [
    GetPage(
      page: () => Home(),
      name: home,
      binding: HomeBinding()
    ),
    GetPage(
      name: editTask,
      page: (() => AddTask()),
      binding: EditTaskTypeBinding()
    )
  ];
}