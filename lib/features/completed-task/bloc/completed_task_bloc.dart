import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'completed_task_event.dart';
part 'completed_task_state.dart';

class CompletedTaskBloc extends Bloc<CompletedTaskEvent, CompletedTaskState> {
  CompletedTaskBloc() : super(CompletedTaskInitial()) {
    on<CompletedTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
