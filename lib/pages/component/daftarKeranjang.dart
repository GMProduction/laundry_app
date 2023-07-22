import 'package:flutter/material.dart';
import 'package:laundry_app/component/req/request.dart';

import '../../component/colors/genColors.dart';
import '../../component/text/genText.dart';

class DaftarKeranjang extends StatelessWidget {
  final String? nama;
  final String? image;
  final String? harga;
  final String? berat;
  final String? qty;
  final String? total;
  final String? deskripsi;

  const DaftarKeranjang({Key? key,  this.nama, this.image, this.harga, this.deskripsi, this.berat, this.qty, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(offset: Offset(5,5), color: Color.fromRGBO(0, 0, 0, 0.05), spreadRadius: 1, blurRadius: 5)
            ]
        ),

        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: image != null ? Image.network(getIp()+image!) : Image.network("https://www.adira.co.id/img/frontend/news/thumb_berapamodalusahalaundryketahuitipsdansumberpinjamannyayukjpg.jpg", fit: BoxFit.cover),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GenText(nama!, fontweight: FontWeight.bold, color: GenColors.primaryColor,),
                GenText(harga!+"/Kg"),
                GenText(deskripsi!, fontSize: 10),
                SizedBox(height: 10,),
                GenText("Total Pakaian : "+qty!+"pcs"),
                GenText("Total berat : "+berat!+"Kg"),
                GenText("Total biaya : "+total!),
              ],
            )
          ],
        ),

      ),
    );
  }
}