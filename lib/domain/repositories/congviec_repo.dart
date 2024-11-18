import 'package:dartz/dartz.dart';

abstract class CongViecRepository {
  Future<Either> getCongViecList();
  Future<Either> getCongViecChoDuyetList();
}
