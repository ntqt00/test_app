import 'package:dartz/dartz.dart';
import 'package:mobile_qlcv/data/models/login_model.dart';

abstract class XacThucRepository {
  Future<Either> dangNhapPortal(LoginModel params);
}
