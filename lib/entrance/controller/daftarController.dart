import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class DaftarController extends GetxController {

  var readytohit = true.obs;
  var dataDaftar;
  final req = new GenRequest();

  void MelakukanPendaftaran(nlengkap, uname, psw) async {
    readytohit.value = false;

    if (nlengkap != null && psw != null) {
      dataDaftar = await req.postFormWoAuth("register", {
        "username": uname,
        "password": psw,
        "name": nlengkap
      });

      readytohit.value = true;

      print("data Login " + dataDaftar.toString());
      try {
        if (dataDaftar["status"] == 200) {
          GetStorage box = GetStorage();
          box.write("token", dataDaftar["payload"]["access_token"]);
          Get.offAndToNamed("/home");
          Get.snackbar("Hai", "Selamat datang " + nlengkap.toString(),
              backgroundColor: Colors.white, borderRadius: 5);
        }
        else {
          Get.snackbar(
              "error", "Cek lagi inputanmu", backgroundColor: Colors.white,
              borderRadius: 5);
          readytohit.value = true;
        }
      }
      catch (e) {
        Get.snackbar(
            "error", "Terjadi Kesalahan", backgroundColor: Colors.white,
            borderRadius: 5);
        readytohit.value = true;
      }

      print("DATA $dataDaftar");
      // print("length" + dataLogin.length.toString());
    }
  }
}
