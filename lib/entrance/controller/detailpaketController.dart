import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class DetailPaketController extends GetxController {
  var dataReady = false.obs;
  var readyToHit = true.obs;
  var dataPaket;
  var dataSimpanKeranjang;
  final req = new GenRequest();

  void LoadPaket(id) async {
    dataReady.value = false;
    dataPaket = await req.getApi("paket/$id");
    print("data Paket " + dataPaket.toString());
    dataReady.value = true;
  }

  void addCart(id, qty, berat) async {
    readyToHit.value = false;
    dataSimpanKeranjang =
        await req.postForm("cart", {"paket": id, "qty": qty, "berat": berat});
    Get.snackbar("Berhasil", "Pesanan sudah masuk di keranjang",
        backgroundColor: Colors.white);

    try {
      if (dataSimpanKeranjang["status"] == 200) {
        Get.offAndToNamed("/home");
      } else {
        Get.snackbar("Error", dataSimpanKeranjang["message"],
            backgroundColor: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi Kesalahan", backgroundColor: Colors.white);
    }
    readyToHit.value = true;
  }
}
