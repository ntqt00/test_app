import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_qlcv/domain/entities/thongtincanhan_entity.dart';
import '../../../domain/usecases/thongtinchung_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetThongTinChungtUseCase getThongTinChungtUseCase;

  ProfileCubit(this.getThongTinChungtUseCase) : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    final result = await getThongTinChungtUseCase.call();

    result.fold(
      (failure) {
        emit(ProfileError(failure.toString()));
      },
      (data) {
        emit(ProfileLoaded(data));
      },
    );
  }
}
