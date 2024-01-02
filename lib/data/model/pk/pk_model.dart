///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class PK {
/*
{
  "koderegistrasi": "0000032/LAW/M/19/lpdp2020",
  "lampiran": null,
  "intake": "2021-08-24",
  "tglsubmit": "1900-01-01 00:00:00",
  "status": "Diterima",
  "picverif": null,
  "tglverif": "2023-04-05 00:00:00",
  "catatanpenolakan": null,
  "batchpk": "PK-172",
  "issubmitpk": 1,
  "alasanubahjadwal": null,
  "buktidukung": null,
  "statusubahjadwal": null,
  "picverifubahjadwal": null,
  "tglverifubahjadwal": null,
  "univtujuan": "Cornell University",
  "keterangan": null,
  "tglusulan": null,
  "statuskelulusan": null,
  "tgllulus": null,
  "isshow": 1,
  "alasanpenolakanid": null,
  "id": null,
  "alasanpenolakan": null,
  "isactive": null,
  "createddate": null,
  "createdbyid": null,
  "updateddate": null,
  "updatedbyid": null,
  "deleteddate": null,
  "deletedbyid": null,
  "module": null,
  "awalperiode": "2021-02-09",
  "akhirperiode": "2021-02-25",
  "undangan": null,
  "issigning": 0,
  "logsigning": null,
  "media": "Daring via Zoom Cloud"
} 
*/

  String? koderegistrasi;
  String? lampiran;
  String? intake;
  String? tglsubmit;
  String? status;
  String? picverif;
  String? tglverif;
  String? catatanpenolakan;
  String? batchpk;
  int? issubmitpk;
  String? alasanubahjadwal;
  String? buktidukung;
  String? statusubahjadwal;
  String? picverifubahjadwal;
  String? tglverifubahjadwal;
  String? univtujuan;
  String? keterangan;
  String? tglusulan;
  String? statuskelulusan;
  String? tgllulus;
  int? isshow;
  String? alasanpenolakanid;
  String? id;
  String? alasanpenolakan;
  String? isactive;
  String? createddate;
  String? createdbyid;
  String? updateddate;
  String? updatedbyid;
  String? deleteddate;
  String? deletedbyid;
  String? module;
  String? awalperiode;
  String? akhirperiode;
  String? undangan;
  int? issigning;
  String? logsigning;
  String? media;

  PK({
    this.koderegistrasi,
    this.lampiran,
    this.intake,
    this.tglsubmit,
    this.status,
    this.picverif,
    this.tglverif,
    this.catatanpenolakan,
    this.batchpk,
    this.issubmitpk,
    this.alasanubahjadwal,
    this.buktidukung,
    this.statusubahjadwal,
    this.picverifubahjadwal,
    this.tglverifubahjadwal,
    this.univtujuan,
    this.keterangan,
    this.tglusulan,
    this.statuskelulusan,
    this.tgllulus,
    this.isshow,
    this.alasanpenolakanid,
    this.id,
    this.alasanpenolakan,
    this.isactive,
    this.createddate,
    this.createdbyid,
    this.updateddate,
    this.updatedbyid,
    this.deleteddate,
    this.deletedbyid,
    this.module,
    this.awalperiode,
    this.akhirperiode,
    this.undangan,
    this.issigning,
    this.logsigning,
    this.media,
  });
  PK.fromJson(Map<String, dynamic> json) {
    koderegistrasi = json['koderegistrasi']?.toString();
    lampiran = json['lampiran']?.toString();
    intake = json['intake']?.toString();
    tglsubmit = json['tglsubmit']?.toString();
    status = json['status']?.toString();
    picverif = json['picverif']?.toString();
    tglverif = json['tglverif']?.toString();
    catatanpenolakan = json['catatanpenolakan']?.toString();
    batchpk = json['batchpk']?.toString();
    issubmitpk = json['issubmitpk']?.toInt();
    alasanubahjadwal = json['alasanubahjadwal']?.toString();
    buktidukung = json['buktidukung']?.toString();
    statusubahjadwal = json['statusubahjadwal']?.toString();
    picverifubahjadwal = json['picverifubahjadwal']?.toString();
    tglverifubahjadwal = json['tglverifubahjadwal']?.toString();
    univtujuan = json['univtujuan']?.toString();
    keterangan = json['keterangan']?.toString();
    tglusulan = json['tglusulan']?.toString();
    statuskelulusan = json['statuskelulusan']?.toString();
    tgllulus = json['tgllulus']?.toString();
    isshow = json['isshow']?.toInt();
    alasanpenolakanid = json['alasanpenolakanid']?.toString();
    id = json['id']?.toString();
    alasanpenolakan = json['alasanpenolakan']?.toString();
    isactive = json['isactive']?.toString();
    createddate = json['createddate']?.toString();
    createdbyid = json['createdbyid']?.toString();
    updateddate = json['updateddate']?.toString();
    updatedbyid = json['updatedbyid']?.toString();
    deleteddate = json['deleteddate']?.toString();
    deletedbyid = json['deletedbyid']?.toString();
    module = json['module']?.toString();
    awalperiode = json['awalperiode']?.toString();
    akhirperiode = json['akhirperiode']?.toString();
    undangan = json['undangan']?.toString();
    issigning = json['issigning']?.toInt();
    logsigning = json['logsigning']?.toString();
    media = json['media']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['koderegistrasi'] = koderegistrasi;
    data['lampiran'] = lampiran;
    data['intake'] = intake;
    data['tglsubmit'] = tglsubmit;
    data['status'] = status;
    data['picverif'] = picverif;
    data['tglverif'] = tglverif;
    data['catatanpenolakan'] = catatanpenolakan;
    data['batchpk'] = batchpk;
    data['issubmitpk'] = issubmitpk;
    data['alasanubahjadwal'] = alasanubahjadwal;
    data['buktidukung'] = buktidukung;
    data['statusubahjadwal'] = statusubahjadwal;
    data['picverifubahjadwal'] = picverifubahjadwal;
    data['tglverifubahjadwal'] = tglverifubahjadwal;
    data['univtujuan'] = univtujuan;
    data['keterangan'] = keterangan;
    data['tglusulan'] = tglusulan;
    data['statuskelulusan'] = statuskelulusan;
    data['tgllulus'] = tgllulus;
    data['isshow'] = isshow;
    data['alasanpenolakanid'] = alasanpenolakanid;
    data['id'] = id;
    data['alasanpenolakan'] = alasanpenolakan;
    data['isactive'] = isactive;
    data['createddate'] = createddate;
    data['createdbyid'] = createdbyid;
    data['updateddate'] = updateddate;
    data['updatedbyid'] = updatedbyid;
    data['deleteddate'] = deleteddate;
    data['deletedbyid'] = deletedbyid;
    data['module'] = module;
    data['awalperiode'] = awalperiode;
    data['akhirperiode'] = akhirperiode;
    data['undangan'] = undangan;
    data['issigning'] = issigning;
    data['logsigning'] = logsigning;
    data['media'] = media;
    return data;
  }
}
