import 'package:dartz/dartz.dart';

import '../../core/usecase/usecase.dart';
import '../../service_locator.dart';
import '../repositories/congviec_repo.dart';

class GetCongViecListUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<CongViecRepository>().getCongViecList();
  }
}

class GetCongViecChoDuyetListUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<CongViecRepository>().getCongViecChoDuyetList();
  }
}
