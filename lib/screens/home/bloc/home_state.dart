part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class FetchWordsInitial extends HomeState {}

final class FetchWordsLoading extends HomeState {}

final class FetchWordsSuccess extends HomeState {}

final class FetchWordsError extends HomeState {
  const FetchWordsError({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
