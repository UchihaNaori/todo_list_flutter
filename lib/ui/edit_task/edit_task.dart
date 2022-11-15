import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/common/utils/extensions.dart';

import 'package:todo_list/data/models/task_type.dart';
import 'package:todo_list/router/routers.dart';

import '../../common/values/colors.dart';
import '../../common/values/icons.dart';
import '../../controller/edit_tasktype_controller.dart';
import '../widgets/icons.dart';

class AddTask extends GetView<EditTaskTypeController> {
  AddTask({Key?key}) : super(key: key);
  final icons = getIcons();
  final titles = title();
  var i = -1;
  String colorSelect = '';
  int iconSelect = Get.find<EditTaskTypeController>().taskType.icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: ListView(
        children: [
            Padding(
              padding: EdgeInsets.all(3.0.wp),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (() {
                      Get.back();
                    }
                  ),
                  icon:const Icon(Icons.close)
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                onPressed: () {
                    if(controller.formKey.currentState!.validate()){
                      controller.updateTaskType();
                    }
                },
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 14.0.sp),
                )
                )
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: Text(
              'Edit Task Type',
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: TextFormField(
              controller: controller.title,
              decoration: InputDecoration(
                focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!))
              ),
              autofocus: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter title task type';
                }

                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0.wp, left: 5.0.wp, bottom: 2.0.wp, right: 5.0.wp),
            child: Text(
              'Icon',
              style: TextStyle(
                fontSize: 14.0.sp,
                color: Colors.grey
              ),
            ),
          ),
          ...icons.map((e) => GetBuilder<EditTaskTypeController>(builder: (controller) {
          i++;
          return InkWell(
            onTap: () {
              i = -1;
              iconSelect = e.icon!.codePoint;
              colorSelect = e.color!.toHex();
              controller.setIcon(e.icon!.codePoint, e.color!.toHex());
            },
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.wp, vertical: 3.0.wp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    e,
                    SizedBox(width: 3.0.wp,),
                    Text(
                      titles[i],
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ]
                ),
                if (iconSelect == e.icon?.codePoint)
                  const Icon(
                    Icons.check,
                    color: Colors.blue,
                  ),
              ],
            ),
          ));})
          )
        ],
      ),)
    );
  }

}