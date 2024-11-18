import 'package:dartz/dartz.dart';
import 'package:mobile_qlcv/data/models/khachhang_model.dart';
import 'package:mobile_qlcv/data/sources/apis/khachhang_api.dart';

import '../../domain/repositories/khachhang_repo.dart';
import '../../service_locator.dart';

class KhachHangRepositoryImpl extends KhachHangRepository {
  @override
  Future<Either> getKhachHangList() async {
    var returnedData = await sl<KhachHangService>().getKhachHangList();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var khachHangs = (data['data'] as List)
            .map((item) => KhachHangModel.fromJson(item).toEntity())
            .toList();
        return Right(khachHangs);
      } catch (e) {
        return Left(Exception('Error parsing KhachHang data: $e'));
      }
    });
  }

  @override
  Future<Either> createKhachHang() {
    // TODO: implement createKhachHang
    throw UnimplementedError();
  }

  @override
  Future<Either> deleteKhachHang(int khachHangId) {
    // TODO: implement deleteKhachHang
    throw UnimplementedError();
  }
}
