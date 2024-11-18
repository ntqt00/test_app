import 'package:dartz/dartz.dart';
import 'package:mobile_qlcv/domain/repositories/xacthuc_repo.dart';
import '../../core/usecase/usecase.dart';
import '../../data/models/login_model.dart';
import '../../service_locator.dart';

class XacThucUseCase extends UseCase<Either, LoginModel> {
  @override
  Future<Either> call({LoginModel? params}) async {
    return await sl<XacThucRepository>().dangNhapPortal(params!);
  }
}
