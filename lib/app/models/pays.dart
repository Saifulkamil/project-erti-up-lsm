// ignore_for_file: unnecessary_this, prefer_collection_literals

import 'package:aset_and_properti_up_lsm/app/models/orders.dart';

class PaysModel {
  String? tanggalTF;
  int? namaTF;
  String? nohpTF;
  String? nameRek;
  String? nameBank;
  int? jumlah;
  String? fotoBukti;
  String? pesan;
  DataOrder? paysOrders;

  PaysModel(
      {this.tanggalTF,
      this.namaTF,
      this.nohpTF,
      this.nameRek,
      this.nameBank,
      this.jumlah,
      this.fotoBukti,
      this.pesan,
      this.paysOrders});

  PaysModel.fromJson(Map<String, dynamic> json) {
    tanggalTF = json['tanggal_TF'];
    namaTF = json['nama_TF'];
    nohpTF = json['nohp_TF'];
    nameRek = json['name_rek'];
    nameBank = json['name_bank'];
    jumlah = json['jumlah'];
    fotoBukti = json['foto_bukti'];
    pesan = json['pesan'];
    paysOrders = json['payment_order'] != null
        ?  DataOrder.fromJson(json['payment_order'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['tanggal_TF'] = this.tanggalTF;
    data['nama_TF'] = this.namaTF;
    data['nohp_TF'] = this.nohpTF;
    data['name_rek'] = this.nameRek;
    data['name_bank'] = this.nameBank;
    data['jumlah'] = this.jumlah;
    data['foto_bukti'] = this.fotoBukti;
    data['pesan'] = this.pesan;
    if (this.paysOrders != null) {
      data['payment_order'] = this.paysOrders!.toJson();
    }
    return data;
  }
}
