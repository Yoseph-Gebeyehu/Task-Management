part of 'edit_task_bloc.dart';

@immutable
sealed class EditTaskEvent {}

class UpdateTask extends EditTaskEvent {
  Task oldTask;
  Task newTask;

  UpdateTask({required this.oldTask, required this.newTask});
}
