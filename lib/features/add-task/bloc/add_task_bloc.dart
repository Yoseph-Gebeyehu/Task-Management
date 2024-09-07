import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/data/model/task.dart';
import 'package:task_management/data/repository/add_task_respository.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc({
    required AddTaskRepository addTaskRepository,
  }) : super(AddTaskInitial()) {
    on<AddTaskSubmitted>((event, emit) async {
      addTaskRepository.addTaskToDatabase(
        task: Task(
          id: 1,
          title: event.title,
          description: event.description,
          startingTime: event.startingTime,
          endingTime: event.endingTime,
        ),
      );
    });
  }
}
