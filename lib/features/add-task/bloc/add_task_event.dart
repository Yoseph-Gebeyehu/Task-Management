part of 'add_task_bloc.dart';

@immutable
sealed class AddTaskEvent {}

class AddTaskSubmitted extends AddTaskEvent {
  final String title;
  final String description;
  final String startingTime;
  final String endingTime;

  AddTaskSubmitted({
    required this.title,
    required this.description,
    required this.startingTime,
    required this.endingTime,
  });
}

// class AddTaskStarted extends AddTaskEvent {}


// class AddTaskSuccess extends AddTaskEvent {
//   final Task task;

//   AddTaskSuccess(this.task);
// }

// class AddTaskFailure extends AddTaskEvent {
//   final String error;

//   AddTaskFailure(this.error);
// }
