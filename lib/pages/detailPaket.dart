import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundry_app/component/colors/genColors.dart';
import 'package:laundry_app/component/text/genText.dart';
import 'package:laundry_app/entrance/controller/detailpaketController.dart';
import '../component/button/roundedButton.dart';
import '../component/form/genTextField.dart';
import 'component/daftarPaket.dart';

class DetailPaket extends StatelessWidget {
  var dpc = Get.put(DetailPaketController());
  var id, qty, berat;

  @override
  Widget build(BuildContext context) {
    id = Get.parameters['id'];

    print(id);
    dpc.LoadPaket(Get.parameters['id']);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Paket"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Column(
              children: [
                Obx(() => dpc.dataReady.value
                    ? DaftarPaket(
                        ontap: () {},
                        nama: dpc.dataPaket["payload"]["nama"],
                        harga: dpc.dataPaket["payload"]["harga"].toString(),
                        deskripsi: dpc.dataPaket["payload"]["deskripsi"],
                        image: dpc.dataPaket["payload"]["gambar"],
                      )
                    : Center(child: CircularProgressIndicator())),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: GenTextFieldRoundedBorder(
                            label: "Jumlah Pakaian",
                            hint: "Masukan Jumlah Pakaian",
                            type: TextInputType.number,
                            onChange: (val) {
                              qty = val;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GenText(
                          "pakaian",
                          fontSize: 16,
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: GenTextFieldRoundedBorder(
                            label: "Estimasi Berat Pakaian",
                            onChange: (val) {
                              berat = val;
                            },
                            hint: "Masukan estimasi berat",
                            type: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GenText(
                          "/Kg",
                          fontSize: 16,
                        )
                      ],
                    ))
              ],
            )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => !dpc.readyToHit.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RoundedButton(
                          ontap: () {
                            dpc.addCart(id, qty, berat);

                          },
                          width: Size(double.infinity, 50),
                          text: "Masukan Ke Keranjang",
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
