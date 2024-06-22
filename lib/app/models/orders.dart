// ignore_for_file: prefer_collection_literals, unnecessary_this

import 'package:aset_and_properti_up_lsm/app/models/asets.dart';
import 'package:aset_and_properti_up_lsm/app/models/users.dart';

class OrdersModel {
  String? name;
  String? phone;
  int? jangkaWaktuSewa;
  String? mulaiSewaTanggal;
  String? mulaiSewaWaktu;
  String? instansi;
  int? totalPembayaran;
  bool? statusPembayaran;
  AsetsModel? ordersAset;
  UsersModel? ordersUsers;

  OrdersModel(
      {this.name,
      this.phone,
      this.jangkaWaktuSewa,
      this.mulaiSewaTanggal,
      this.mulaiSewaWaktu,
      this.instansi,
      this.totalPembayaran,
      this.statusPembayaran,
      this.ordersAset,
      this.ordersUsers});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    jangkaWaktuSewa = json['jangka_waktu_sewa'];
    mulaiSewaTanggal = json['mulai_sewa_tanggal'];
    mulaiSewaWaktu = json['mulai_sewa_waktu'];
    instansi = json['instansi'];
    totalPembayaran = json['total_pembayaran'];
    statusPembayaran = json['status_pembayaran'];
    ordersAset = json['orders_aset'] != null
        ? AsetsModel.fromJson(json['orders_aset'])
        : null;
    ordersUsers = json['orders_users'] != null
        ?  UsersModel.fromJson(json['orders_users'])
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
    if (this.ordersAset != null) {
      data['orders_aset'] = this.ordersAset!.toJson();
    }
    if (this.ordersUsers != null) {
      data['orders_users'] = this.ordersUsers!.toJson();
    }
    return data;
  }
}
