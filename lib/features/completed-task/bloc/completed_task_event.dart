part of 'completed_task_bloc.dart';

@immutable
sealed class CompletedTaskEvent {}

class LoadCompletedTasks extends CompletedTaskEvent {}
