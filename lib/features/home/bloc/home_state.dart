part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Task> tasks;

  HomeLoaded(this.tasks);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
