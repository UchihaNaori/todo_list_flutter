import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/common/values/colors.dart';
import '../../../common/utils/extensions.dart';
import '../../../controller/home_controller.dart';
import '../../../controller/home_repository_controller.dart';
import '../../../data/models/task_type.dart';
import '../../widgets/icons.dart';

class AddCard extends GetWidget {
  final homeCtrl = Get.find<HomeController>();
  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = getIcons();
    var squareWith = Get.width - 12.0.wp;

    return Container(
      width: squareWith / 2,
      height: squareWith / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              radius: 5,
              title: 'Task type',
              content: Form(
                key: homeCtrl.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                      child: TextFormField(
                        controller: homeCtrl.editTaskType,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Task type'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please type title task';
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                      child: Wrap(
                        spacing: 2.0.wp,
                        children: icon
                            .map((e) => Obx(() {
                                  final index = icon.indexOf(e);
                                  return ChoiceChip(
                                    selectedColor: Colors.grey[200],
                                    pressElevation: 0,
                                    backgroundColor: Colors.white,
                                    label: e,
                                    selected:
                                        homeCtrl.chipIndex.value == index,
                                    onSelected: (bool selected) {
                                      homeCtrl.chipIndex.value =
                                          selected ? index : 0;
                                    },
                                  );
                                }))
                            .toList(),
                      )
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size(150, 40),
                      ),
                      onPressed: () {
                        if (homeCtrl.formKey.currentState!.validate()) {
                          int hexIcon = icon[homeCtrl.chipIndex.value].icon!.codePoint;
                          String color = icon[homeCtrl.chipIndex.value].color!.toHex();
                          var task = TaskType(
                            id: 0,
                            title: homeCtrl.editTaskType.text,
                            color: color,
                            icon: hexIcon,
                          );
                          homeCtrl.createTaskType(task);
                          homeCtrl.addTaskType.value ? EasyLoading.showSuccess('Success') : EasyLoading.showError('Duplicated task');
                          Get.back();
                        }
                      },
                      child: const Text('Confrim')
                    )
                  ],
                ),
              ));
              homeCtrl.setChipIndex(0);
              homeCtrl.editTaskType.clear();
              homeCtrl.setAddTaskType(false);
        },
        child: DottedBorder(
            color: Colors.grey[400]!,
            dashPattern: const [8, 4],
            child: Center(
                child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ))),
      ),
    );
  }

}
