part of 'edit_task_bloc.dart';

@immutable
abstract class EditTaskState {}

class EditTaskInitial extends EditTaskState {}

class TaskUpdated extends EditTaskState {}

class EditTaskError extends EditTaskState {
  final String message;

  EditTaskError(this.message);
}
