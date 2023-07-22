import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/component/helper/JustHelper.dart';
import 'package:laundry_app/component/req/request.dart';

import '../../component/colors/genColors.dart';
import '../../component/text/genText.dart';

class DaftarPaket extends StatelessWidget {
  final Function() ontap;
  final String? nama;
  final String? image;
  final String? harga;
  final String? deskripsi;

  const DaftarPaket({Key? key, required this.ontap, this.nama, this.image, this.harga, this.deskripsi})
      : super(key: key);


  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: ontap,
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 5),
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  spreadRadius: 1,
                  blurRadius: 5)
            ]),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                  image == null ? "https://www.adira.co.id/img/frontend/news/thumb_berapamodalusahalaundryketahuitipsdansumberpinjamannyayukjpg.jpg" : getIp()+image,
                  fit: BoxFit.cover),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GenText(
                  nama!,
                  fontweight: FontWeight.bold,
                  color: GenColors.primaryColor,
                ),
                GenText(formatRupiahUseprefik(harga!)+"/Kg"),
                GenText(deskripsi!),
              ],
            )
          ],
        ),
      ),
    );
  }
}
