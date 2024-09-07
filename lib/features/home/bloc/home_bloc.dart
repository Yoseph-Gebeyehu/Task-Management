import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/data/repository/get_task_repository.dart';

import '../../../data/model/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required GetTaskRepository getTaskRepository})
      : super(HomeInitial()) {
    on<LoadTasks>((event, emit) async {
      List<Task> taskList = await getTaskRepository.getTasksFromDataBase();
      emit(HomeLoaded(taskList));
    });
  }
}
