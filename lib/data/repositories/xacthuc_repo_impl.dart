import 'package:dartz/dartz.dart';
import 'package:mobile_qlcv/data/models/login_model.dart';
import 'package:mobile_qlcv/data/sources/apis/xacthuc_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/xacthuc_repo.dart';
import '../../service_locator.dart';

class XacThucRepositoryImpl extends XacThucRepository {
  @override
  Future<Either> dangNhapPortal(LoginModel params) async {
    var returnedData = await sl<XacThucService>().dangNhapPortal(params);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var token = data['access-token'];
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('access_token', token);
        });
        return Right(token);
      } catch (e) {
        return Left(Exception('Error getting data: $e'));
      }
    });
  }
}
