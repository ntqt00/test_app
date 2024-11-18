import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_qlcv/presentation/home/bloc/congviec_state.dart';
import '../../../../service_locator.dart';
import '../../../domain/usecases/congviec_usecase.dart';

class CongViecCubit extends Cubit<CongViecState> {
  final GetCongViecListUseCase _getCongViecListUseCase =
      sl<GetCongViecListUseCase>();

  CongViecCubit() : super(CongViecLoading());

  Future<void> getCongViecList() async {
    var result = await _getCongViecListUseCase.call();
    result.fold(
      (failure) => emit(CongViecLoadFailure()),
      (congViecs) {
        emit(CongViecLoaded(
          hoanthanhs: congViecs['hoanthanhs'] ?? [],
          thuchiens: congViecs['thuchiens'] ?? [],
          thamgias: congViecs['thamgias'] ?? [],
          khacs: congViecs['khacs'] ?? [],
        ));
      },
    );
  }
}
