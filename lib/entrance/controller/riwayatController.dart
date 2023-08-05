import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class RiwayatController extends GetxController {
  var dataReady = false.obs;
  var readyToHit = true.obs;
  var total = 0.obs;
  var lengthRiwayat = 0.obs;
  var dataRiwayat;
  var dataCheckout;
  final req = new GenRequest();

  void LoadRiwayat() async {
    dataReady.value = false;
    dataRiwayat = await req.getApi("transaksi");
    print("data Riwayat  $dataRiwayat");

    if (dataRiwayat != null && dataRiwayat["status"] == 200) {
      lengthRiwayat.value = dataRiwayat["payload"].length;
      if (lengthRiwayat < 0) {
        for (int i = 0; i < lengthRiwayat.value; i++) {
          total = total + dataRiwayat["payload"][i]["total"];
        }
      }
    }
    print("Total  $total");
    dataReady.value = true;

    // print("length" + dataLogin.length.toString());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print("Riwayat Onready");
    LoadRiwayat();
  }
}
