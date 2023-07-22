import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/component/colors/genColors.dart';
import 'package:laundry_app/component/helper/JustHelper.dart';
import 'package:laundry_app/component/text/genText.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../component/button/roundedButton.dart';
import '../component/form/genTextField.dart';
import '../entrance/controller/cartController.dart';
import 'component/daftarKeranjang.dart';
import 'component/daftarPaket.dart';

class Keranjang extends StatelessWidget {
  Keranjang({super.key});

  var cartController = Get.put(CartController());
  String alamat = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Keranjang"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(() => cartController.dataReady.value
                  ? LiquidPullToRefresh(
                      showChildOpacityTransition: false,
                      onRefresh: () async {
                        cartController.LoadCart();
                      },
                      child: SingleChildScrollView(
                        child: Column(
                            children: cartController.dataCart == null
                                ? [Center(child: CircularProgressIndicator())]
                                : cartController.dataCart["payload"]
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
                      ),
                    )
                  : Center(child: CircularProgressIndicator())),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => GenText(
                "Total : " +
                    formatRupiahUseprefik(
                        cartController.total.value.toString()),
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
              child: RoundedButton(
                ontap: () {
                  // cartController.checkOut();
                  Get.bottomSheet(
                    Container(
                        padding: EdgeInsets.all(20),
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Container()),
                            GenTextFieldRoundedBorder(
                              label: "Alamat",
                              hint: "Masukan Alamat Pengambilan",
                              type: TextInputType.text,
                              onChange: (val) {
                                alamat = val;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Obx(
                              () => !cartController.readyToHit.value
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : RoundedButton(
                                      ontap: () {
                                        cartController.checkOut(alamat);
                                      },
                                      width: Size(double.infinity, 50),
                                      text: "Checkout",
                                      textColor: Colors.white,
                                      bgColor: GenColors.secondColor,
                                    ),
                            )
                          ],
                        )),
                    isDismissible: false,
                    enableDrag: false,
                  );
                },
                width: Size(double.infinity, 50),
                text: "Checkout",
                textColor: Colors.white,
                bgColor: GenColors.secondColor,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
