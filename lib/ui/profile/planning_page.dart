import 'package:app/app_controller/planning_controller.dart';
import 'package:app/app_controller/task_controller.dart';
import 'package:app/models/task_model.dart';
import 'package:app/services/notification_services.dart';
import 'package:app/ui/add_task_bar.dart';
import 'package:app/ui/plan_task.dart';
import 'package:app/ui/theme.dart';
import 'package:app/ui/widgets/task_tile.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../models/teacher_model.dart';
import '../widgets/table_widget.dart';

class PlanningPage extends StatefulWidget {
  final String rule;

  const PlanningPage({Key? key, required this.rule}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  final PlanningTaskController planningTaskController =
      Get.find<PlanningTaskController>();

  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanningTaskController>(
        init: PlanningTaskController(),
        builder: (planningTaskController) {
          return Scaffold(
              backgroundColor: context.theme.backgroundColor,
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        _addTaskBar(),
                        _addDateBar(),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: planningTaskController.science.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      planningTaskController.science.length,
                                  itemBuilder: (context, index) {
                                    Data info =
                                        planningTaskController.science[index];
                                    return TableWidget(
                                      startTime: info.noteTime.toString(),
                                      fan: info.week.toString(),
                                      sinf: info.classRoom.toString(),
                                      note: info.note!,
                                      onChanged: () {},
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                  'Bu kun uchun vazifalar mavjud emas',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Get.isDarkMode
                                          ? Colors.grey.shade400
                                          : Colors.grey.shade600,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25),
                                )),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: planningTaskController.isLoading,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Colors.red,
                    )),
                  )
                ],
              ));
        });
  }


  _addDateBar() {
    return Container(
      color: context.theme.backgroundColor,
      margin: const EdgeInsets.only(top: 20, left: 5),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectedTextColor:  Colors.orange,
        selectionColor: Colors.orange.shade100,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
            debugPrint('hhhhhhhhhhhhhh${_selectedDate.weekday}');
            planningTaskController.getDeyTask(
                _selectedDate.weekday, widget.rule);
          });
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat("dd.MM.yy").format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: headingStyle,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              await Get.to(PlanTaskBarPage(
                week: _selectedDate.weekday,
                role: widget.rule,
              ));
            },
            child: Text("+ Add Task"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange)),
          ),
        ]));
  }
}
