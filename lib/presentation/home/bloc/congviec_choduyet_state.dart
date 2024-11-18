import '../../../domain/entities/congviec_entity.dart';

abstract class CongViecChoDuyetState {}

class CongViecChoDuyetLoading extends CongViecChoDuyetState {}

class CongViecChoDuyetLoadFailure extends CongViecChoDuyetState {}

class CongViecChoDuyetLoaded extends CongViecChoDuyetState {
  final List<CongViecEntity> choduyets;

  CongViecChoDuyetLoaded({
    required this.choduyets,
  });
}
