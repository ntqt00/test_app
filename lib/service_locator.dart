import 'package:get_it/get_it.dart';
import 'package:mobile_qlcv/core/network/dio_client.dart';
import 'package:mobile_qlcv/data/repositories/congviec_repo_impl.dart';
import 'package:mobile_qlcv/data/repositories/khachhang_repo_impl.dart';
import 'package:mobile_qlcv/data/repositories/thongtinchung_repo_impl.dart';
import 'package:mobile_qlcv/data/repositories/xacthuc_repo_impl.dart';
import 'package:mobile_qlcv/data/sources/apis/congviec_api.dart';
import 'package:mobile_qlcv/data/sources/apis/khachhang_api.dart';
import 'package:mobile_qlcv/data/sources/apis/thongtinchung_api.dart';
import 'package:mobile_qlcv/data/sources/apis/xacthuc_api.dart';
import 'package:mobile_qlcv/domain/repositories/congviec_repo.dart';
import 'package:mobile_qlcv/domain/repositories/khachhang_repo.dart';
import 'package:mobile_qlcv/domain/repositories/thongtinchung_repo.dart';
import 'package:mobile_qlcv/domain/repositories/xacthuc_repo.dart';
import 'package:mobile_qlcv/domain/usecases/congviec_usecase.dart';
import 'package:mobile_qlcv/domain/usecases/khachhang_usecase.dart';
import 'package:mobile_qlcv/domain/usecases/thongtinchung_usecase.dart';
import 'package:mobile_qlcv/domain/usecases/xacthuc_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<KhachHangService>(KhachHangServiceImpl());
  sl.registerSingleton<XacThucService>(XacThucServiceImpl());
  sl.registerSingleton<CongViecService>(CongViecServiceImpl());
  sl.registerSingleton<ThongTinChungService>(ThongTinChungServiceImpl());

  // Repostories
  sl.registerSingleton<KhachHangRepository>(KhachHangRepositoryImpl());
  sl.registerSingleton<XacThucRepository>(XacThucRepositoryImpl());
  sl.registerSingleton<CongViecRepository>(CongViecRepositoryImpl());
  sl.registerSingleton<ThongTinChungRepository>(ThongTinChungRepositoryImpl());

  // Usecases
  sl.registerSingleton<GetKhachHangListUseCase>(GetKhachHangListUseCase());
  sl.registerSingleton<XacThucUseCase>(XacThucUseCase());
  sl.registerSingleton<GetCongViecListUseCase>(GetCongViecListUseCase());
  sl.registerSingleton<GetCongViecChoDuyetListUseCase>(
      GetCongViecChoDuyetListUseCase());
  sl.registerSingleton<GetThongTinChungtUseCase>(GetThongTinChungtUseCase());
}
