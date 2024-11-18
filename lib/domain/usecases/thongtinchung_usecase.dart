import 'package:dartz/dartz.dart';

import '../../core/usecase/usecase.dart';
import '../../service_locator.dart';
import '../repositories/thongtinchung_repo.dart';

class GetThongTinChungtUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ThongTinChungRepository>().getThongTinChung();
  }
}
