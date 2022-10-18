part of 'figma_fetch_cubit.dart';

abstract class FigmaFetchState extends Equatable {
  const FigmaFetchState();
  @override
  List<Object> get props => [];
}

class FigmaFetchInitial extends FigmaFetchState {}

class FigmaFetchLoading extends FigmaFetchState {}

class FigmaFetchLoaded extends FigmaFetchState {
  final List<Result> figmaList;

  const FigmaFetchLoaded({
    required this.figmaList,
  });

  @override
  List<Object> get props => [figmaList];
}

class FigmaFetchError extends FigmaFetchState {
  final Failure failure;

  const FigmaFetchError({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}
