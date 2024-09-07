import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/data/repository/task_respository.dart';

import '../../../data/model/task.dart';

part 'completed_task_event.dart';
part 'completed_task_state.dart';

class CompletedTaskBloc extends Bloc<CompletedTaskEvent, CompletedTaskState> {
  CompletedTaskBloc({required TaskRepository taskRepository})
      : super(CompletedTaskInitial()) {
    on<LoadCompletedTasks>((event, emit) async {
      List<Task> taskList = await taskRepository.getTasksFromDataBase();
      emit(CompletedTasks(taskList));
    });
  }
}
