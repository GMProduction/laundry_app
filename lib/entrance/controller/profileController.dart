import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class ProfileController extends GetxController  {
  var dataReady = false.obs;
  var readyToHit = true.obs;
  var total = 0.obs;
  var lengthCart = 0.obs;
  var dataCart;
  var dataCheckout;
  var nama = "".obs;
  var alamat = "".obs;
  var nohp = "".obs;
  final req = new GenRequest();

  void LoadProfile() async {
    dataReady.value = false;
    dataCart = await req.getApi("profile");
    print("data Profile  $dataCart");
    nama.value = dataCart["payload"]["nama"];

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
    print("Cart Onready");
    LoadProfile();
  }
}
