import 'package:app/app_controller/task_controller.dart';
import 'package:app/models/task_model.dart';
import 'package:app/services/notification_services.dart';
import 'package:app/ui/add_task_bar.dart';
import 'package:app/ui/theme.dart';
import 'package:app/ui/widgets/task_tile.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../app_controller/add_task_controller.dart';
import '../../models/teacher_model.dart';
import '../widgets/table_widget.dart';

class TablePage extends StatefulWidget {
  final String rule;

  const TablePage({Key? key, required this.rule}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final AddTaskController addTaskController = Get.find<AddTaskController>();

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
    return GetBuilder<AddTaskController>(
        init: AddTaskController(),
        builder: (addTaskController) {
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
                        _showTasks(),
                        Expanded(
                          child: addTaskController.science.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: addTaskController.science.length,
                                  itemBuilder: (context, index) {
                                    Data info =
                                        addTaskController.science[index];
                                    int ts = info.noteTime!;
                                    DateTime tsdate =
                                        DateTime.fromMillisecondsSinceEpoch(ts);
                                    String datetime = tsdate.year.toString() +
                                        "/" +
                                        tsdate.month.toString() +
                                        "/" +
                                        tsdate.day.toString();
                                    print(datetime);
                                    return TableWidget(
                                      startTime: datetime,
                                      fan: info.science.toString(),
                                      sinf: info.classRoom.toString(),
                                      note: info.note!,
                                      onChanged: () {},
                                    );
                                  },
                                )
                              :  Center(
                                  child: Text(
                                  'Bu kun uchun vazifalar mavjud emas',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Get.isDarkMode?Colors.grey.shade400:Colors.grey.shade600,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25),
                                )),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: addTaskController.isLoading,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Colors.red,
                    )),
                  )
                ],
              ));
        });
  }

  _showTasks() {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, index) {
            Task task = _taskController.taskList[index];
            if (task.repeat == "Daily") {
              DateTime date = DateFormat.jm().parse(task.startTime.toString());
              var myTime = DateFormat("HH:mm").format(date);
              notifyHelper.sceduleNotification(
                  int.parse(myTime.toString().split(":")[0]),
                  int.parse(myTime.toString().split(":")[1]),
                  task);
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, task);
                              },
                              child: TaskTile(task)),
                        ],
                      ),
                    ),
                  ));
            }
            if (task.date == DateFormat.yMd().format(_selectedDate)) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, task);
                              },
                              child: TaskTile(task)),
                        ],
                      ),
                    ),
                  ));
            } else {
              return Container();
            }
          });
    });
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4),
      height: task.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      color: Get.isDarkMode ? darkGreyClr : Colors.white,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.orange[600] : Colors.grey[300],
            ),
          ),
          const Spacer(),
          task.isCompleted == 1
              ? Container()
              : _bottomSheetButton(
                  label: "Vazifa tugallandi",
                  onTab: () {
                    _taskController.markTaskCompleted(task.id!);
                    Get.back();
                  },
                  clr: primaryClr,
                  context: context,
                ),
          _bottomSheetButton(
            label: "Vazifani o'chirish",
            onTab: () {
              _taskController.delete(task);
              Get.back();
            },
            clr: Colors.red[300]!,
            context: context,
          ),
          const SizedBox(
            height: 20,
          ),
          _bottomSheetButton(
            label: "Yopish",
            onTab: () {
              Get.back();
            },
            clr: Colors.red[300]!,
            isClose: true,
            context: context,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTab,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: isClose == true
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr),
          borderRadius: BorderRadius.circular(20),
          color: isClose == true ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
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
        selectedTextColor: bluishClrw,
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
            addTaskController.getDeyTask(_selectedDate.weekday, widget.rule);
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
              await Get.to(AddTaskBarPage(
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
