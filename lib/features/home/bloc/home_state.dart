part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Task> tasks;
  final Quote quote;

  HomeLoaded(this.tasks, this.quote);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class TaskDeleted extends HomeState {}

class FetchedQuote extends HomeState {
  final Quote quote;
  FetchedQuote(this.quote);
}
