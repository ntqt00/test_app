import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/configs/constants/api_urls.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

abstract class ThongTinChungService {
  Future<Either> getThongTinChung();
}

class ThongTinChungServiceImpl implements ThongTinChungService {
  @override
  Future<Either> getThongTinChung() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrls.thongTinChung,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
