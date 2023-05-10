import 'package:app/app_controller/add_task_controller.dart';
import 'package:app/controller/task_controller.dart';
import 'package:app/models/task_model.dart';
import 'package:app/ui/theme.dart';
import 'package:app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskBarPage extends StatefulWidget {
  final int week;

  const AddTaskBarPage({Key? key,required this.week}) : super(key: key);

  @override
  State<AddTaskBarPage> createState() => _AddTaskBarPageState();
}

class _AddTaskBarPageState extends State<AddTaskBarPage> {
  final TaskController _taskController=Get.put(TaskController());

  final AddTaskController addTaskController = Get.find<AddTaskController>();

  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];

  String _selectedRepeat = "Yo'q";
  List<String> repeatList = ["Yo'q", "Har kuni", "Haftalik", "Oylik"];
  int _selectedColor=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.EEEE().format(DateTime.now()),
                style: headingStyle,
              ),
               MyInputField(title: "Sarlavha", hint: "Fan",controller: addTaskController.scienceController,),
               MyInputField(
                  title: "O'qituvchi ismi", hint: "O'qituvchi ismi",controller: addTaskController.teacherNameController,),
              MyInputField(
                title: "Xabar vaqti",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                        title: "Boshlanish vaqti",
                        hint: _startTime,
                        widget: IconButton(
                          onPressed: () {
                            _getTimeFromUser(isStartTime: true);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: MyInputField(
                        title: "Tugash vaqti",
                        hint: _endTime,
                        widget: IconButton(
                          onPressed: () {
                            _getTimeFromUser(isStartTime: false);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      )),
                ],
              ),
              MyInputField(
                  title: "Eslatish",
                  hint: "$_selectedRemind minute oldin",
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    style: subTitleStyle,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                    items:
                    remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()));
                    }).toList(),
                  )),
              MyInputField(
                  title: "Takrorlash",
                  hint: "$_selectedRepeat",
                  widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    style: subTitleStyle,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRepeat = newValue!;
                      });
                    },
                    items: repeatList
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value!,
                            style: const TextStyle(color: Colors.grey),
                          ));
                    }).toList(),
                  )),
              const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 _colorPallete(),
                  ElevatedButton(
                    onPressed: ()  {
                      _validateDate();
                      addTaskController.addTaskNetwork(widget.week);
                    },
                    child:  const Text("Saqlash"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orange)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
  _validateDate(){
    if(addTaskController.scienceController.text.isNotEmpty&&addTaskController.teacherNameController.text.isNotEmpty){
      _addTaskToDb();
      Get.back();
    }else if(addTaskController.scienceController.text.isEmpty||addTaskController.teacherNameController.text.isEmpty){
      Get.snackbar("Talab qilinadi", "Hamma maydon talab qilinadi !",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      icon: const Icon(Icons.warning_amber_rounded));
    }
  }
  _addTaskToDb()async {
    int value =await _taskController.addTask(
        task:Task(
          note: addTaskController.teacherNameController.text,
          title:addTaskController.scienceController.text,
          date:DateFormat.yMd().format(addTaskController.selectedDate),
          startTime:addTaskController.startTimeController.text,
          endTime:addTaskController.endTimeController.text,
          remind:_selectedRemind,
          repeat:_selectedRepeat,
          color:_selectedColor,
          isCompleted:0,
        ),
    );
    print("My  id is "+"$value");
  }
  _colorPallete(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rang",
          style: titleStyle,
        ),
        const SizedBox(height: 8.0,),
        Wrap(
            children: List<Widget>.generate(3, (int index) {
              return  GestureDetector(
                onTap: (){
                  setState(() {
                    _selectedColor=index;
                    print("$index");
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index==0?primaryClr:index==1?pinkClr:yellowClr,
                    child: _selectedColor==index?const Icon(Icons.done,
                      color: Colors.white,
                      size: 16,
                    ):Container(),
                  ),
                ),
              );
            })
        )
      ],
    );
  }
  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );

    if (_pickerDate != null) {
      setState(() {
        addTaskController.selectedDate = _pickerDate;
        String sdatetime = addTaskController.selectedDate.toString();
        DateTime sdate = DateTime.parse(sdatetime);
        addTaskController.stimestamp = sdate.microsecondsSinceEpoch;

      });
    } else {
      print("U null yoki biror narsa noto'g'ri");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.toString();
    if (pickedTime == null) {
      print("Vaqt bekor qilindi");
    } else if (isStartTime == true) {
      setState(() {
        DateTime start = DateTime.parse(formatedTime);
        addTaskController.startTime = start.microsecondsSinceEpoch;
        debugPrint('${addTaskController.startTime}');
      });
    } else if (isStartTime == false) {
      setState(() {
        DateTime end = DateTime.parse(formatedTime);
        addTaskController.endTime = end.microsecondsSinceEpoch;
        debugPrint('${addTaskController.endTime}');
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}
