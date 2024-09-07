part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadTasks extends HomeEvent {}

class DeleteTask extends HomeEvent {
  final Task task;
  DeleteTask({required this.task});
}

class DeleteAllTasks extends HomeEvent {}

class UpdateTaskStatus extends HomeEvent {
  final Task oldTask;
  final Task newTask;

  UpdateTaskStatus({required this.oldTask, required this.newTask});
}
