// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:mobile_qlcv/data/models/login_model.dart';

// import '../../../core/configs/constants/api_urls.dart';
// import '../../../core/network/dio_client.dart';
// import '../../../service_locator.dart';

// abstract class XacThucService {
//   Future<Either> dangNhapPortal(LoginModel params);
// }

// class XacThucServiceImpl implements XacThucService {
//   @override
//   Future<Either> dangNhapPortal(LoginModel params) async {
//     try {
//       var response =
//           await sl<DioClient>().post(ApiUrls.xacThucUrl, data: params.toJson());
//       print('Chạy tới đây ròi nè');
//       return Right(response.data);
//     } on DioException catch (e) {
//       return Left(e.response!.data['message']);
//     }
//   }
// }

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/io_client.dart';
import 'dart:io';
import 'package:mobile_qlcv/data/models/login_model.dart';

import '../../../core/configs/constants/api_urls.dart';

abstract class XacThucService {
  Future<Either> dangNhapPortal(LoginModel params);
}

class XacThucServiceImpl implements XacThucService {
  @override
  Future<Either> dangNhapPortal(LoginModel params) async {
    try {
      // Disable certificate verification
      final ioClient = IOClient(HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true);

      final url = Uri.parse(ApiUrls.xacThucUrl);
      final response = await ioClient.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(params.toJson()),
      );

      if (response.statusCode == 201) {
        return Right(json.decode(response.body));
      } else {
        return Left('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }
}
