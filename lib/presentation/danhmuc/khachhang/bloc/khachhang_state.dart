import 'package:mobile_qlcv/domain/entities/khachhang_entity.dart';

abstract class KhachHangState {}

class KhachHangLoading extends KhachHangState {}

class KhachHangLoadFailure extends KhachHangState {}

class KhachHangLoaded extends KhachHangState {
  final List<KhachHangEntity> customers;
  KhachHangLoaded({required this.customers});
}
