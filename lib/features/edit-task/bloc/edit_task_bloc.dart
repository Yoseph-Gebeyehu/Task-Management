import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/task.dart';
import '../../../data/repository/task_respository.dart';

part 'edit_task_event.dart';
part 'edit_task_state.dart';

class EditTaskBloc extends Bloc<EditTaskEvent, EditTaskState> {
  EditTaskBloc({required TaskRepository taskRepository})
      : super(EditTaskInitial()) {
    on<UpdateTask>((event, emit) {
      taskRepository.updateTask(
        oldTask: event.oldTask,
        newTask: event.newTask,
      );

      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: "task_channel",
          title: event.newTask.title,
          body: event.newTask.description,
        ),
      );
    });
  }
}
