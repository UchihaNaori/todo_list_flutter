import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_list/common/values/colors.dart';
import 'package:todo_list/controller/home_controller.dart';
import 'package:todo_list/router/routers.dart';
import 'package:todo_list/ui/home_view/widgets/add_card.dart';
import 'package:todo_list/ui/home_view/widgets/task_card.dart';
import '../../common/utils/extensions.dart';
import 'package:get/get.dart';
import '../../data/models/task_type.dart';

class Home extends GetView<HomeController> {
  const Home({Key?key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(4.0.wp),
                child: Text('My List',
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              GetBuilder<HomeController>(builder: (controller) {
              return GridView.count(
                crossAxisCount:2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.tasks.map(
                    (e) => Draggable(
                      data: e,
                      onDragStarted: () => controller.setShowIconDelete(true),
                      onDraggableCanceled: (_, __) => controller.setShowIconDelete(false),
                      onDragEnd: (_) => controller.setShowIconDelete(false),
                      feedback: Opacity(opacity: 0.8, child: TaskCard(taskType: e),) ,
                      childWhenDragging: Container(),
                      child: TaskCard(taskType: e,),
                    )
                  ).toList(),
                  AddCard()
                  ],
              );
              })
            ],
          ),
      ),
      floatingActionButton:DragTarget<TaskType>(
        builder: (_, __, ___){
          return  Obx(() => FloatingActionButton(
            backgroundColor: controller.showIconDelete.value ? Colors.red : blue,
            onPressed:() {
              Get.toNamed(RouterNavigation.editTask);
            },
            child: Icon((controller.showIconDelete.value) ? Icons.delete : Icons.add),
          )
          );
        },
        onAccept: (TaskType taskType) {
          controller.deleteTaskType(taskType);
          EasyLoading.showSuccess('Delete Success');
        } ,
      )
    );
  }
}