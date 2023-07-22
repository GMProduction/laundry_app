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

    total.value = dataRiwayat["payload"]["total"];
    dataReady.value = true;
  }

  // void addCart(id, qty, berat) async {
  //   readyToHit.value = false;
  //   dataSimpanKeranjang =
  //       await req.postForm("cart", {"paket": id, "qty": qty, "berat": berat});
  //   print("dataSimpanKeranjang" + dataSimpanKeranjang.toString());
  //
  //   try {
  //     if (dataSimpanKeranjang["status"] == 200) {
  //       Get.offAndToNamed("/home");
  //     } else {
  //       Get.snackbar("Error", dataSimpanKeranjang["message"],
  //           backgroundColor: Colors.white);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Terjadi Kesalahan", backgroundColor: Colors.white);
  //   }
  //   readyToHit.value = true;
  // }
}
