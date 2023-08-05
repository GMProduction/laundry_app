import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/pages/component/daftarRiwayat.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../component/helper/JustHelper.dart';
import '../entrance/controller/riwayatController.dart';

class Riwayat extends StatelessWidget {
  var rc = Get.put(RiwayatController());

  @override
  Widget build(BuildContext context) {
    rc.LoadRiwayat();

    return Obx(() => rc.dataReady.value
        ? LiquidPullToRefresh(
        showChildOpacityTransition: false,
        onRefresh: () async {
          rc.LoadRiwayat();
        },
          child: SingleChildScrollView(
              child: Column(
                  children: rc.dataRiwayat == null
                      ? [Center(child: CircularProgressIndicator())]
                      : rc.dataRiwayat["payload"].map<Widget>((e) {
                          return DaftarRiwayat(
                            ontap: () {
                              Get.toNamed("/detailriwayat?id="+e["id"].toString());
                            },
                            notrans:  e["no_transaksi"],
                            tanggal: formatTanggalFromString(e["tanggal"]),
                            status:  cartStatus(e["status"]),
                            total: formatRupiahUseprefik(e["total"].toString()),
                          );
                        }).toList()),
            ),
        )
        : Center(child: CircularProgressIndicator()));
  }
}
