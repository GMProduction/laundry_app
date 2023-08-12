import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class BayarController extends GetxController {
  var dataReady = false.obs;
  var readyToHit = true.obs;
  var dataSimpanBayar;
  final req = new GenRequest();

  void bayar(id, metode) async {
    readyToHit.value = false;
    dataSimpanBayar = await req.postForm("transaksi/bayar/$id", {"metoded":metode});
    print("checkout :" + dataSimpanBayar.toString());

    try {
      if (dataSimpanBayar["status"] == 200) {
        Get.offAndToNamed("/home");
        Get.toNamed("/suksesbayar");
      } else {
        Get.snackbar("Error", dataSimpanBayar["message"],
            backgroundColor: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi Kesalahan", backgroundColor: Colors.white);
    }
    readyToHit.value = true;
  }

}
