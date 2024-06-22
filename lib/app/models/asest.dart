class AsestModel {
  String? nama;
  String? lokasi;
  String? alamat;
  String? kabupaten;
  int? harga;
  String? booking;
  String? jangka_waktu;
  String? picture;
  bool? status;

  AsestModel(
      {this.nama,
      this.lokasi,
      this.alamat,
      this.kabupaten,
      this.harga,
      this.booking,
      this.jangka_waktu,
      this.picture,
      this.status});

  AsestModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    lokasi = json['lokasi'];
    alamat = json['alamat'];
    kabupaten = json['kabupaten'];
    harga = json['harga'];
    booking = json['booking'];
    jangka_waktu = json['jangka_waktu'];
    picture = json['picture'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['nama'] = this.nama;
    data['lokasi'] = this.lokasi;
    data['alamat'] = this.alamat;
    data['kabupaten'] = this.kabupaten;
    data['harga'] = this.harga;
    data['booking'] = this.booking;
    data['jangka_waktu'] = this.jangka_waktu;
    data['picture'] = this.picture;
    data['status'] = this.status;
    return data;
  }
}
