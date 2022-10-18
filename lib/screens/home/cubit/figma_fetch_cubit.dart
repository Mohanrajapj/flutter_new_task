import 'package:api_with_cubit/models/failure_model.dart';
import 'package:api_with_cubit/models/figma_model.dart';
import 'package:api_with_cubit/repository/api_reposiitory.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'figma_fetch_state.dart';

class FigmaFetchCubit extends Cubit<FigmaFetchState> {
  final ApiRepository apiRepository;

  FigmaFetchCubit({required this.apiRepository}) : super(FigmaFetchInitial());

  Future<void> fetchPostApi() async {
    emit(FigmaFetchLoading());
    try {
      final List<Result>? postList = await apiRepository.getFigmaList();
      emit(FigmaFetchLoaded(figmaList: postList ?? []));
    } on Failure catch (err) {
      emit(FigmaFetchError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }
}
