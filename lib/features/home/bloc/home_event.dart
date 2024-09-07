part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadTasks extends HomeEvent {}

class DeleteTask extends HomeEvent {
  final Task task;
  DeleteTask({required this.task});
}
