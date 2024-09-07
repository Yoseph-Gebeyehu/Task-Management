import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/domain/date_picker.dart';
import 'package:task_management/domain/text_form.dart';
import 'package:task_management/domain/validator_service.dart';
import 'package:task_management/features/add-task/bloc/add_task_bloc.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController startingTimeController = TextEditingController();
  final TextEditingController endingTimeController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocConsumer<AddTaskBloc, AddTaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(deviceSize.width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add a new task.',
                      style: TextStyle(
                        fontSize: deviceSize.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: deviceSize.height * 0.02),
                    CustomTextForm(
                      hintText: 'Task Title',
                      controller: taskTitleController,
                      validator: (value) =>
                          FormValidatorService.validateTaskTitle(
                        value!,
                        context,
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
                      isUpdate: false,
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
                      isUpdate: false,
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
                          context.read<AddTaskBloc>().add(
                                AddTaskSubmitted(
                                  title: taskTitleController.text,
                                  description: taskDescriptionController.text,
                                  startingTime: startingTimeController.text,
                                  endingTime: endingTimeController.text,
                                ),
                              );
                          Navigator.pop(context);
                        }
                        // Handle Add Task logic here
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
                        'Add Task',
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
          );
        },
      ),
    );
  }
}
