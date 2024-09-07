import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/data/repository/task_respository.dart';

import '../../../data/model/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required TaskRepository taskRepository}) : super(HomeInitial()) {
    on<LoadTasks>((event, emit) async {
      List<Task> taskList = await taskRepository.getTasksFromDataBase();
      emit(HomeLoaded(taskList));
    });
    on<DeleteTask>((event, emit) async {
      await taskRepository.deleteTaskFromDB(task: event.task);
      emit(TaskDeleted());
    });
  }
}
