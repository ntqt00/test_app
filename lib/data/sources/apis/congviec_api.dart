import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/configs/constants/api_urls.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class CongViecService {
  Future<Either> getCongViecList();
  Future<Either> getCongViecChoDuyetList();
}

class CongViecServiceImpl implements CongViecService {
  @override
  Future<Either> getCongViecList() async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrls.congViec}/danh-sach',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getCongViecChoDuyetList() async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrls.congViec}/danh-sach-cho-duyet',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
