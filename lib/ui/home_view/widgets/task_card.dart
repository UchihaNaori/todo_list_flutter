import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:todo_list/common/utils/extensions.dart';
import 'package:todo_list/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/data/models/task_type.dart';
import 'package:todo_list/router/routers.dart';
import 'package:todo_list/ui/widgets/icons.dart';
import '../../../common/values/icons.dart';

class TaskCard extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final TaskType taskType;
  TaskCard({Key?key, required this.taskType}): super(key: key);
  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    final color = HexColor.fromHex(taskType.color.toUpperCase());
    var squareWith = Get.width - 12.0.wp;
    return InkWell(
      onTap: () {
        // Get.toNamed(RouterNavigation.editTask, arguments: taskType);
        Get.find<HomeController>().updateTaskType(taskType);
      },
      child: Container(
      width: squareWith/2,
      height: squareWith/2,
      margin: EdgeInsets.all(3.0.wp),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 7,
            offset: const Offset(0, 7)
          )
        ]
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepProgressIndicator(
            totalSteps: 100,
            currentStep: 80,
            size: 5,
            padding: 0,
            selectedGradientColor:LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.5), color],
            ),
            unselectedGradientColor:const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.white]
            ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Icon(
                IconData(taskType.icon, fontFamily: 'MaterialIcons'),
                color: color,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(6.0.wp),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskType.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0.sp
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.0.wp),
                  const Text(
                    '0 tasks',
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Colors.grey
                    ),
                  )
                ],
              )
            )
        ],
      ),
    ));
  }

}