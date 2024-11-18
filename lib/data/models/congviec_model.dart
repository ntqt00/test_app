import '../../domain/entities/congviec_entity.dart';

class CongViecModel {
  final num? congViecId;
  final String? maCv;
  final String? tenCv;
  final num? loaiCvId;
  final String? tenLoaiCv;
  final num? mucDoCvId;
  final String? tenMucDo;
  final num? nguonId;
  final String? tenNguon;
  final num? trangThaiCvId;
  final String? tenTrangThai;
  final num? nhomId;
  final String? tenNhom;
  final num? loaiNhomId;
  final num? nhomChaId;
  final num? cap;
  final String? ngayTao;
  final String? ngayDuyet;
  final String? hanXl;
  final String? ngayHt;
  final String? ngayCn;
  final num? congViecChaId;
  final String? nguoiTao;
  final String? nguoiThucHien;

  CongViecModel({
    required this.congViecId,
    required this.maCv,
    required this.tenCv,
    required this.loaiCvId,
    required this.tenLoaiCv,
    required this.mucDoCvId,
    required this.tenMucDo,
    required this.nguonId,
    required this.tenNguon,
    required this.trangThaiCvId,
    required this.tenTrangThai,
    required this.nhomId,
    required this.tenNhom,
    required this.loaiNhomId,
    required this.nhomChaId,
    required this.cap,
    required this.ngayTao,
    required this.ngayDuyet,
    required this.hanXl,
    required this.ngayHt,
    required this.ngayCn,
    required this.congViecChaId,
    required this.nguoiTao,
    required this.nguoiThucHien,
  });

  factory CongViecModel.fromJson(Map<String, dynamic> json) {
    return CongViecModel(
      congViecId: json['CONGVIEC_ID'],
      maCv: json['MA_CV'],
      tenCv: json['TEN_CV'],
      loaiCvId: json['LOAICV_ID'],
      tenLoaiCv: json['TEN_LOAICV'],
      mucDoCvId: json['MUCDOCV_ID'],
      tenMucDo: json['TEN_MUCDO'],
      nguonId: json['NGUON_ID'],
      tenNguon: json['TEN_NGUON'],
      trangThaiCvId: json['TRANGTHAICV_ID'],
      tenTrangThai: json['TEN_TRANGTHAI'],
      nhomId: json['NHOM_ID'],
      tenNhom: json['TEN_NHOM'],
      loaiNhomId: json['LOAINHOM_ID'],
      nhomChaId: json['NHOM_CHA_ID'],
      cap: json['CAP'],
      ngayTao: json['NGAY_TAO'],
      ngayDuyet: json['NGAY_DUYET'],
      hanXl: json['HAN_XL'],
      ngayHt: json['NGAY_HT'],
      ngayCn: json['NGAY_CN'],
      congViecChaId: json['CONGVIEC_CHA_ID'],
      nguoiTao: json['NGUOI_TAO'],
      nguoiThucHien: json['NGUOI_THUCHIEN'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CONGVIEC_ID': congViecId,
      'MA_CV': maCv,
      'TEN_CV': tenCv,
      'LOAICV_ID': loaiCvId,
      'TEN_LOAICV': tenLoaiCv,
      'MUCDOCV_ID': mucDoCvId,
      'TEN_MUCDO': tenMucDo,
      'NGUON_ID': nguonId,
      'TEN_NGUON': tenNguon,
      'TRANGTHAICV_ID': trangThaiCvId,
      'TEN_TRANGTHAI': tenTrangThai,
      'NHOM_ID': nhomId,
      'TEN_NHOM': tenNhom,
      'LOAINHOM_ID': loaiNhomId,
      'NHOM_CHA_ID': nhomChaId,
      'CAP': cap,
      'NGAY_TAO': ngayTao,
      'NGAY_DUYET': ngayDuyet,
      'HAN_XL': hanXl,
      'NGAY_HT': ngayHt,
      'NGAY_CN': ngayCn,
      'CONGVIEC_CHA_ID': congViecChaId,
      'NGUOI_TAO': nguoiTao,
      'NGUOI_THUCHIEN': nguoiThucHien,
    };
  }
}

extension CongViecModelX on CongViecModel {
  CongViecEntity toEntity() {
    return CongViecEntity(
      congViecId: congViecId,
      maCv: maCv,
      tenCv: tenCv,
      loaiCvId: loaiCvId,
      tenLoaiCv: tenLoaiCv,
      mucDoCvId: mucDoCvId,
      tenMucDo: tenMucDo,
      nguonId: nguonId,
      tenNguon: tenNguon,
      trangThaiCvId: trangThaiCvId,
      tenTrangThai: tenTrangThai,
      nhomId: nhomId,
      tenNhom: tenNhom,
      loaiNhomId: loaiNhomId,
      nhomChaId: nhomChaId,
      cap: cap,
      ngayTao: ngayTao,
      ngayDuyet: ngayDuyet,
      hanXl: hanXl,
      ngayHt: ngayHt,
      ngayCn: ngayCn,
      congViecChaId: congViecChaId,
      nguoiTao: nguoiTao,
      nguoiThucHien: nguoiThucHien,
    );
  }
}
