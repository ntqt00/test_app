import 'package:dartz/dartz.dart';
import 'package:mobile_qlcv/domain/repositories/khachhang_repo.dart';

import '../../core/usecase/usecase.dart';
import '../../service_locator.dart';

class GetKhachHangListUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<KhachHangRepository>().getKhachHangList();
  }
}
