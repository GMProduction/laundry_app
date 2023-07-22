import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class PaketController extends GetxController{
  var dataReady = false.obs;
  var dataPaket;
  final req = new GenRequest();

  void LoadPaket() async {
    dataReady.value = false;
    dataPaket = await req.getApi("paket");
    print("data Paket " + dataPaket.toString());
    dataReady.value = true;
    // print("length" + dataLogin.length.toString());
  }

  Future<void> refreshData() async {
    dataReady.value = false;
    dataPaket = await req.getApi("paket");
    print("data Paket " + dataPaket.toString());
    dataReady.value = true;

    }


  @override
  void onReady() {
    // TODO: implement onInit
    super.onReady();
    LoadPaket();
    print("ON READY");
  }

  @override
  void onClose() {
    // TODO: implement onInit
    super.onClose;
    print("ON Close");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
