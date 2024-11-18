import 'package:dartz/dartz.dart';

abstract class KhachHangRepository {
  Future<Either> getKhachHangList();
  Future<Either> createKhachHang();
  Future<Either> deleteKhachHang(int khachHangId);
  // Future<bool> isLoggedIn();
}
