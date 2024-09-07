import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'empty_task_event.dart';
part 'empty_task_state.dart';

class EmptyTaskBloc extends Bloc<EmptyTaskEvent, EmptyTaskState> {
  EmptyTaskBloc() : super(EmptyTaskInitial()) {
    on<EmptyTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
