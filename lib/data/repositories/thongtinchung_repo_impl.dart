import 'package:dartz/dartz.dart';
import 'package:mobile_qlcv/data/models/thongtincanhan_model.dart';
import '../../domain/repositories/thongtinchung_repo.dart';
import '../../service_locator.dart';
import '../sources/apis/thongtinchung_api.dart';

class ThongTinChungRepositoryImpl extends ThongTinChungRepository {
  @override
  Future<Either> getThongTinChung() async {
    var returnedData = await sl<ThongTinChungService>().getThongTinChung();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var thongTinCaNhan =
            ThongTinCaNhanModel.fromJson(data['thongTinCaNhan']).toEntity();
        return Right(thongTinCaNhan);
      } catch (e) {
        return Left(Exception('Error parsing thong tin chung data: $e'));
      }
    });
  }
}
