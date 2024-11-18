import '../../domain/entities/thongtincanhan_entity.dart';

class ThongTinCaNhanModel {
  final int? nhanvienId;
  final int? donviId;
  final String? maNv;
  final String? tenNv;
  final String? soDt;
  final int? nhanvienOnebssId;
  final int? donviChaId;
  final String? maDv;
  final String? tenDv;
  final int? donviOnebssId;

  ThongTinCaNhanModel({
    required this.nhanvienId,
    required this.donviId,
    required this.maNv,
    required this.tenNv,
    required this.soDt,
    required this.nhanvienOnebssId,
    required this.donviChaId,
    required this.maDv,
    required this.tenDv,
    required this.donviOnebssId,
  });

  factory ThongTinCaNhanModel.fromJson(Map<String, dynamic> json) {
    return ThongTinCaNhanModel(
      nhanvienId: json['NHANVIEN_ID'],
      donviId: json['DONVI_ID'],
      maNv: json['MA_NV'],
      tenNv: json['TEN_NV'],
      soDt: json['SO_DT'],
      nhanvienOnebssId: json['NHANVIEN_ONEBSS_ID'],
      donviChaId: json['DONVI_CHA_ID'],
      maDv: json['MA_DV'],
      tenDv: json['TEN_DV'],
      donviOnebssId: json['DONVI_ONEBSS_ID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'NHANVIEN_ID': nhanvienId,
      'DONVI_ID': donviId,
      'MA_NV': maNv,
      'TEN_NV': tenNv,
      'SO_DT': soDt,
      'NHANVIEN_ONEBSS_ID': nhanvienOnebssId,
      'DONVI_CHA_ID': donviChaId,
      'MA_DV': maDv,
      'TEN_DV': tenDv,
      'DONVI_ONEBSS_ID': donviOnebssId,
    };
  }
}

extension ThongTinCaNhanModelX on ThongTinCaNhanModel {
  ThongTinCaNhanEntity toEntity() {
    return ThongTinCaNhanEntity(
      nhanvienId: nhanvienId,
      donviId: donviId,
      maNv: maNv,
      tenNv: tenNv,
      soDt: soDt,
      nhanvienOnebssId: nhanvienOnebssId,
      donviChaId: donviChaId,
      maDv: maDv,
      tenDv: tenDv,
      donviOnebssId: donviOnebssId,
    );
  }
}
