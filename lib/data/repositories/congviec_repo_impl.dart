import 'package:dartz/dartz.dart';
import 'package:mobile_qlcv/data/models/congviec_model.dart';
import '../../domain/repositories/congviec_repo.dart';
import '../../service_locator.dart';
import '../sources/apis/congviec_api.dart';

class CongViecRepositoryImpl extends CongViecRepository {
  @override
  Future<Either> getCongViecList() async {
    var returnedData = await sl<CongViecService>().getCongViecList();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        // Categorizing the data by type
        var hoanthanhs = (data['data']['hoanthanhs'] as List)
            .map((item) => CongViecModel.fromJson(item).toEntity())
            .toList();

        var thuchiens = (data['data']['thuchiens'] as List)
            .map((item) => CongViecModel.fromJson(item).toEntity())
            .toList();

        var thamgias = (data['data']['thamgias'] as List)
            .map((item) => CongViecModel.fromJson(item).toEntity())
            .toList();

        var khacs = (data['data']['khacs'] as List)
            .map((item) => CongViecModel.fromJson(item).toEntity())
            .toList();

        // Return the categorized lists
        return Right({
          'hoanthanhs': hoanthanhs,
          'thuchiens': thuchiens,
          'thamgias': thamgias,
          'khacs': khacs,
        });
      } catch (e) {
        return Left(Exception('Error parsing CongViec data: $e'));
      }
    });
  }

  @override
  Future<Either> getCongViecChoDuyetList() async {
    var returnedData = await sl<CongViecService>().getCongViecChoDuyetList();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        // Categorizing the data by type
        var choduyets = (data['data']['choduyets'] as List)
            .map((item) => CongViecModel.fromJson(item).toEntity())
            .toList();

        return Right({
          'choduyets': choduyets,
        });
      } catch (e) {
        return Left(Exception('Error parsing CongViec data: $e'));
      }
    });
  }
}
