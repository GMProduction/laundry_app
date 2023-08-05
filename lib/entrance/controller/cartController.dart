import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class CartController extends GetxController  {
  var dataReady = false.obs;
  var readyToHit = true.obs;
  var total = 0.obs;
  var lengthCart = 0.obs;
  var dataCart;
  var dataCheckout;
  final req = new GenRequest();

  void LoadCart() async {
    dataReady.value = false;
    dataCart = await req.getApi("cart");
    print("data Cart  $dataCart");

    if (dataCart != null && dataCart["status"] == 200) {
      lengthCart.value = dataCart["payload"].length;
      for (int i = 0; i < lengthCart.value; i++) {
        total = total + int.parse(dataCart["payload"][i]["total"]);
      }
    }
    print("Total  $total");
    dataReady.value = true;

    // print("length" + dataLogin.length.toString());
  }

  void checkOut(alamat) async {
    readyToHit.value = false;
    dataCheckout = await req.postForm("cart/checkout", {"alamat":alamat});
    print("checkout :" + dataCheckout.toString());

    try {
      if (dataCheckout["status"] == 200) {
        Get.offAndToNamed("/home");
        Get.snackbar("Sukses", "Transaksimu berhasil dibuat",
            backgroundColor: Colors.white);
      } else {
        Get.snackbar("Error", dataCheckout["message"],
            backgroundColor: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi Kesalahan", backgroundColor: Colors.white);
    }
    readyToHit.value = true;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print("Cart Onready");
    LoadCart();
  }
}
