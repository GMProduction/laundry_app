import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundry_app/component/colors/genColors.dart';
import 'package:laundry_app/component/text/genText.dart';
import 'package:laundry_app/entrance/controller/cartController.dart';
import 'package:laundry_app/entrance/controller/paketController.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'component/daftarPaket.dart';

class Home extends StatelessWidget {
  Home({super.key});

  var paketController = Get.put(PaketController());

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("its lifecycle");
    if (state == AppLifecycleState.resumed) {
      paketController.LoadPaket();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => paketController.dataReady.value
          ? LiquidPullToRefresh(
              showChildOpacityTransition: false,
              onRefresh: () async {
                paketController.LoadPaket();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                    children: paketController.dataPaket == null
                        ? [Center(child: CircularProgressIndicator())]
                        : paketController.dataPaket["payload"].map<Widget>((e) {
                            return DaftarPaket(
                              ontap: () {
                                Get.toNamed("/detail?id=" + e["id"].toString());
                              },
                              nama: e["nama"],
                              harga: e["harga"].toString(),
                              deskripsi: e["deskripsi"],
                              image: e["gambar"],
                            );
                          }).toList()),
              ),
            )
          : Center(child: CircularProgressIndicator())),
    );
  }
}
