import '../../domain/entities/khachhang_entity.dart';

class KhachHangModel {
  final num? khachHangId;
  final String? tenKhachHang;
  final num? trangThaiId;

  KhachHangModel({
    required this.khachHangId,
    required this.tenKhachHang,
    required this.trangThaiId,
  });

  factory KhachHangModel.fromJson(Map<String, dynamic> json) {
    return KhachHangModel(
      khachHangId: json['KHACHHANG_ID'],
      tenKhachHang: json['TEN_KHACHHANG'],
      trangThaiId: json['TRANGTHAI_ID'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'KHACHHANG_ID': khachHangId,
      'TEN_KHACHHANG': tenKhachHang,
      'TRANGTHAI_ID': trangThaiId,
    };
  }
}

extension KhachHangModelX on KhachHangModel {
  KhachHangEntity toEntity() {
    return KhachHangEntity(
      khachHangId: khachHangId,
      tenKhachHang: tenKhachHang,
      trangThaiId: trangThaiId,
    );
  }
}
