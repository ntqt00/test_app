import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_qlcv/presentation/danhmuc/khachhang/bloc/khachhang_state.dart';

import '../../../../domain/usecases/khachhang_usecase.dart';
import '../../../../service_locator.dart';

class KhachHangCubit extends Cubit<KhachHangState> {
  final GetKhachHangListUseCase _getKhachHangListUseCase =
      sl<GetKhachHangListUseCase>();

  KhachHangCubit() : super(KhachHangLoading());

  Future<void> getKhachHangList() async {
    var result = await _getKhachHangListUseCase.call();
    result.fold(
      (failure) => emit(KhachHangLoadFailure()),
      (customers) => emit(KhachHangLoaded(customers: customers)),
    );
  }
}
