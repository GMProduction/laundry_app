import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class DetailRiwayatController extends GetxController {
  var dataReady = false.obs;
  var readyToHit = true.obs;
  var total = 0.obs;
  var dataRiwayat;
  var dataSimpanKeranjang;
  final req = new GenRequest();

  void LoadRiwayat(id) async {
    dataReady.value = false;
    dataRiwayat = await req.getApi("transaksi/$id");
    print("data Riwayat " + dataRiwayat.toString());

    total.value = int.parse(dataRiwayat["payload"]["total"]);
    dataReady.value = true;
  }

}
