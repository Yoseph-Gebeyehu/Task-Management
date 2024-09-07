import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/data/model/task.dart';
import 'package:task_management/data/repository/task_respository.dart';
import 'package:uuid/uuid.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc({
    required TaskRepository taskRepository,
  }) : super(AddTaskInitial()) {
    on<AddTaskSubmitted>((event, emit) async {
      final Uuid uuid = Uuid();
      String uniqueId = uuid.v4();

      taskRepository.addTaskToDatabase(
        task: Task(
          id: uniqueId,
          title: event.title,
          description: event.description,
          startingTime: event.startingTime,
          endingTime: event.endingTime,
        ),
      );
    });
  }
}
