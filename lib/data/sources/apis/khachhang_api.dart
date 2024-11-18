import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/configs/constants/api_urls.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class KhachHangService {
  Future<Either> getKhachHangList();
  Future<Either> createKhachHang();
  Future<Either> deleteKhachHang(int khachHangId);
}

class KhachHangServiceImpl implements KhachHangService {
  @override
  Future<Either> getKhachHangList() async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrls.khachHang}/danh-sach',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> deleteKhachHang(int khachHangId) {
    // TODO: implement deleteKhachHang
    throw UnimplementedError();
  }

  @override
  Future<Either> createKhachHang() {
    // TODO: implement getKhachHangList
    throw UnimplementedError();
  }
}
