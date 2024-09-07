import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/domain/date_picker.dart';
import 'package:task_management/domain/text_form.dart';
import 'package:task_management/domain/validator_service.dart';
import 'package:task_management/features/edit-task/bloc/edit_task_bloc.dart';
import '../../../data/model/task.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;
  const EditTaskPage({
    required this.task,
    super.key,
  });

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController startingTimeController = TextEditingController();
  TextEditingController endingTimeController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskTitleController = TextEditingController(text: widget.task.title);
    taskDescriptionController =
        TextEditingController(text: widget.task.description);
    startingTimeController =
        TextEditingController(text: widget.task.startingTime);
    endingTimeController = TextEditingController(text: widget.task.endingTime);
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update this task'),
        elevation: 3,
      ),
      body: BlocListener<EditTaskBloc, EditTaskState>(
        listener: (context, state) {},
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(deviceSize.width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Update this task.',
                    style: TextStyle(
                      fontSize: deviceSize.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.02),
                  FocusScope(
                    child: CustomTextForm(
                      hintText: 'Task Title',
                      controller: taskTitleController,
                      validator: (value) =>
                          FormValidatorService.validateTaskTitle(
                        value!,
                        context,
                      ),
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.02),
                  CustomTextForm(
                    hintText: 'Task Description',
                    controller: taskDescriptionController,
                    validator: (value) =>
                        FormValidatorService.validateTaskDescription(
                      value!,
                      context,
                    ),
                  ),
                  SizedBox(height: deviceSize.height * 0.02),
                  CustomDatePicker(
                    isUpdate: true,
                    controller: startingTimeController,
                    fromOrTo: 'From',
                    hintText: 'Select starting time',
                    onTap: () async {
                      TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (timeOfDay != null) {
                        String period =
                            timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
                        String formattedTime =
                            '${timeOfDay.hourOfPeriod}:${timeOfDay.minute.toString().padLeft(2, '0')} $period';
                        startingTimeController.text = formattedTime;
                        setState(() {});
                      }
                    },
                  ),
                  SizedBox(height: deviceSize.height * 0.02),
                  CustomDatePicker(
                    isUpdate: true,
                    controller: endingTimeController,
                    fromOrTo: 'To',
                    hintText: 'Select ending time',
                    onTap: () async {
                      TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (timeOfDay != null) {
                        String period =
                            timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
                        String formattedTime =
                            '${timeOfDay.hourOfPeriod}:${timeOfDay.minute.toString().padLeft(2, '0')} $period';
                        endingTimeController.text = formattedTime;
                        setState(() {});
                      }
                    },
                  ),
                  SizedBox(height: deviceSize.height * 0.05),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          startingTimeController.text.isNotEmpty &&
                          endingTimeController.text.isNotEmpty) {
                        final updatedTask = Task(
                          id: widget.task.id,
                          title: taskTitleController.text,
                          description: taskDescriptionController.text,
                          startingTime: startingTimeController.text,
                          endingTime: endingTimeController.text,
                          isCompleted: widget.task.isCompleted,
                        );

                        context.read<EditTaskBloc>().add(
                              UpdateTask(
                                oldTask: widget.task,
                                newTask: updatedTask,
                              ),
                            );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      elevation: 0,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Update Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceSize.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    startingTimeController.dispose();
    endingTimeController.dispose();
    super.dispose();
  }
}
