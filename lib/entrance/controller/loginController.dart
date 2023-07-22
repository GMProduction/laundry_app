import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class LoginController extends GetxController {

  var readytohit = true.obs;
  var dataLogin;
  final req = new GenRequest();

  void MelakukanPenLoginan(uname, psw) async {
    readytohit.value = false;

    if (uname != null && psw != null) {
      dataLogin = await req.postFormWoAuth("login", {
        "username": uname,
        "password": psw
      });

      readytohit.value = true;

      try {
        print("data Login " + dataLogin.toString());
        if (dataLogin["status"] == 200) {
          GetStorage box = GetStorage();
          box.write("token", dataLogin["payload"]["access_token"]);
          Get.offAndToNamed("/home");
          Get.snackbar("Hai", "Selamat datang " + uname.toString(), backgroundColor: Colors.white, borderRadius: 5);
        }
        else {
          Get.snackbar("error", "Username dan Password tidak terdaftar", backgroundColor: Colors.white, borderRadius: 5);
          readytohit.value = true;
        }
      } catch (e) {
        Get.snackbar("error", "Terjadi Kesalahan", backgroundColor: Colors.white, borderRadius: 5);
        readytohit.value = true;
      }


      print("DATA $dataLogin");
      // print("length" + dataLogin.length.toString());
    }
  }
}