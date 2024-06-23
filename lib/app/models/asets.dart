// ignore_for_file: non_constant_identifier_names, unnecessary_this, prefer_collection_literals

class AsetsModel {
  String? docId;
  AsetDetails? data;

  AsetsModel({this.docId, this.data});

  AsetsModel.fromJson(Map<String, dynamic> json) {
    docId = json['docId'];
    data = json['data'] != null ? AsetDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['docId'] = this.docId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AsetDetails {
  String? title;
  String? lokasi;
  String? alamat;
  String? kabupaten;
  int? harga;
  String? kategori;
  String? jangka_waktu;
  String? picture;

  AsetDetails({
    this.title,
    this.lokasi,
    this.alamat,
    this.kabupaten,
    this.kategori,
    this.harga,
    this.jangka_waktu,
    this.picture,
  });

  AsetDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    lokasi = json['lokasi'];
    alamat = json['alamat'];
    kabupaten = json['kabupaten'];
    harga = json['harga'];
    kategori = json['kategori'];
    jangka_waktu = json['jangka_waktu'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['lokasi'] = this.lokasi;
    data['alamat'] = this.alamat;
    data['kabupaten'] = this.kabupaten;
    data['harga'] = this.harga;
    data['kategori'] = this.kategori;
    data['jangka_waktu'] = this.jangka_waktu;
    data['picture'] = this.picture;
    return data;
  }
}
