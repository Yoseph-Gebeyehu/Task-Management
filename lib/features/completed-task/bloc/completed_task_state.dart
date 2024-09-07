part of 'completed_task_bloc.dart';

@immutable
sealed class CompletedTaskState {}

final class CompletedTaskInitial extends CompletedTaskState {}

class CompletedTasks extends CompletedTaskState {
  final List<Task> tasks;

  CompletedTasks(this.tasks);
}
