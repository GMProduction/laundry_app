import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/component/colors/genColors.dart';
import 'package:laundry_app/component/helper/JustHelper.dart';
import 'package:laundry_app/component/text/genText.dart';
import 'package:laundry_app/entrance/controller/detailriwayatController.dart';

import '../component/button/roundedButton.dart';
import '../component/form/genTextField.dart';
import '../entrance/controller/cartController.dart';
import 'component/daftarKeranjang.dart';
import 'component/daftarPaket.dart';

class DetailRiwayat extends StatelessWidget {
  DetailRiwayat({super.key});

  DetailRiwayatController drc = Get.put(DetailRiwayatController());

  @override
  Widget build(BuildContext context) {
    drc.LoadRiwayat(Get.parameters["id"]);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Transaksi"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Obx(() => drc.dataReady.value
                ? Column(
                    children: drc.dataRiwayat == null
                        ? [Center(child: CircularProgressIndicator())]
                        : [
                            GenText("Nomor Transaksi :" +
                                drc.dataRiwayat["payload"]["no_transaksi"]),
                            GenText("Tanggal :" +
                                formatTanggalFromString(drc.dataRiwayat["payload"]["tanggal"])),
                            GenText("Status :" +
                                drc.dataRiwayat["payload"]["status"].toString()),
                          ])
                : CircularProgressIndicator()),
            Expanded(
              child: Obx(() => drc.dataReady.value
                  ? SingleChildScrollView(
                      child: Column(
                          children: drc.dataRiwayat == null
                              ? [Center(child: CircularProgressIndicator())]
                              : drc.dataRiwayat["payload"]["detail"]
                                  .map<Widget>((e) {
                                  return DaftarKeranjang(
                                    nama: e["paket"]["nama"],
                                    harga: formatRupiahUseprefik(
                                        e["harga"].toString()),
                                    deskripsi: e["paket"]["deskripsi"],
                                    image: e["paket"]["gambar"],
                                    qty: e["qty"].toString(),
                                    berat: e["berat"].toString(),
                                    total: formatRupiahUseprefik(
                                        e["total"].toString()),
                                  );
                                }).toList()),
                    )
                  : Center(child: CircularProgressIndicator())),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => GenText(
                "Total : " + formatRupiahUseprefik(drc.total.value.toString()),
                color: Colors.deepOrange,
                fontweight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => !drc.readyToHit.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RoundedButton(
                          ontap: () {
                            Get.toNamed("/bayar?total="+drc.total.value.toString()+"&idtrans="+Get.parameters["id"]!);
                          },
                          width: Size(double.infinity, 50),
                          text: "Bayar Sekarang",
                          textColor: Colors.white,
                          bgColor: GenColors.secondColor,
                        ),
                )),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
