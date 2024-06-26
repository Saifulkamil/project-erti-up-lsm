// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:aset_and_properti_up_lsm/app/models/asets.dart';
import 'package:aset_and_properti_up_lsm/app/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class OrdersModel {
  String? docId;
  DataOrder? data;

  OrdersModel({this.docId, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    docId = json['docId'];
    data = json['data'] != null ?  DataOrder.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['docId'] = this.docId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataOrder {
  String? name;
  String? phone;
  int? jangkaWaktuSewa;
  Timestamp? mulaiSewaTanggal;
  String? mulaiSewaWaktu;
  String? instansi;
  int? totalPembayaran;
  bool? statusPembayaran;
  AsetDetails? orderAset;
  UsersModel? orderUser;

  DataOrder(
      {this.name,
      this.phone,
      this.jangkaWaktuSewa,
      this.mulaiSewaTanggal,
      this.mulaiSewaWaktu,
      this.instansi,
      this.totalPembayaran,
      this.statusPembayaran,
      this.orderAset,
      this.orderUser});

  DataOrder.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    jangkaWaktuSewa = json['jangka_waktu_sewa'];
    mulaiSewaTanggal = json['mulai_sewa_tanggal'];
    mulaiSewaWaktu = json['mulai_sewa_waktu'];
    instansi = json['instansi'];
    totalPembayaran = json['total_pembayaran'];
    statusPembayaran = json['status_pembayaran'];
    orderAset = json['orders_aset'] != null
        ? AsetDetails.fromJson(json['orders_aset'])
        : null;
    orderUser = json['orders_user'] != null
        ?  UsersModel.fromJson(json['orders_user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['jangka_waktu_sewa'] = this.jangkaWaktuSewa;
    data['mulai_sewa_tanggal'] = this.mulaiSewaTanggal;
    data['mulai_sewa_waktu'] = this.mulaiSewaWaktu;
    data['instansi'] = this.instansi;
    data['total_pembayaran'] = this.totalPembayaran;
    data['status_pembayaran'] = this.statusPembayaran;
    if (this.orderAset != null) {
      data['orders_aset'] = this.orderAset!.toJson();
    }
    if (this.orderUser != null) {
      data['orders_users'] = this.orderUser!.toJson();
    }
    return data;
  }
}
