import 'package:mobile_qlcv/domain/entities/congviec_entity.dart';

abstract class CongViecState {}

class CongViecLoading extends CongViecState {}

class CongViecLoadFailure extends CongViecState {}

class CongViecLoaded extends CongViecState {
  final List<CongViecEntity> hoanthanhs;
  final List<CongViecEntity> thuchiens;
  final List<CongViecEntity> thamgias;
  final List<CongViecEntity> khacs;

  CongViecLoaded({
    required this.hoanthanhs,
    required this.thuchiens,
    required this.thamgias,
    required this.khacs,
  });
}
