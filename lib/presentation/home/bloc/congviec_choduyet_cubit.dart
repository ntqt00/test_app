import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_qlcv/presentation/home/bloc/congviec_choduyet_state.dart';
import '../../../../service_locator.dart';
import '../../../domain/usecases/congviec_usecase.dart';

class CongViecChoDuyetCubit extends Cubit<CongViecChoDuyetState> {
  final GetCongViecChoDuyetListUseCase _getCongViecChoDuyetListUseCase =
      sl<GetCongViecChoDuyetListUseCase>();

  CongViecChoDuyetCubit() : super(CongViecChoDuyetLoading());

  Future<void> getCongViecChoDuyetList() async {
    var result = await _getCongViecChoDuyetListUseCase.call();
    result.fold(
      (failure) => emit(CongViecChoDuyetLoadFailure()),
      (congViecs) {
        emit(CongViecChoDuyetLoaded(
          choduyets: congViecs['choduyets'] ?? [],
        ));
      },
    );
  }
}
