import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/data/model/api_response.dart';
import 'package:task_management/data/model/quote.dart';
import 'package:task_management/data/repository/quotes_repository.dart';
import 'package:task_management/data/repository/task_respository.dart';
import '../../../data/model/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TaskRepository taskRepository;
  final QuotesRepository quoteRepository;

  HomeBloc({
    required this.taskRepository,
    required this.quoteRepository,
  }) : super(HomeInitial()) {
    on<LoadTasks>((event, emit) async {
      List<Task> taskList = await taskRepository.getTasksFromDataBase();
      try {
        ApiResponse apiResponse = await quoteRepository.getQuote();

        if (apiResponse.status == 200) {
          Quote quote = Quote.fromJson(apiResponse.body[0]);
          emit(HomeLoaded(taskList, quote));
        } else {
          emit(HomeLoaded(
              taskList, Quote(content: 'No quote available', author: '')));
        }
      } catch (e) {
        emit(
          HomeLoaded(
            taskList,
            Quote(
              content: 'An error occurred while fetching the quote.',
              author: '',
            ),
          ),
        );
      }
    });
    on<UpdateTaskStatus>((event, emit) async {
      await taskRepository.updateTask(
        oldTask: event.oldTask,
        newTask: event.newTask,
      );
    });
    on<DeleteTask>((event, emit) async {
      await taskRepository.deleteTaskFromDB(task: event.task);
      emit(TaskDeleted());
    });
    on<DeleteAllTasks>((event, emit) async {
      await taskRepository.deleteAllTasks();
    });
  }
}
