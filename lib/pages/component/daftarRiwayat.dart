import 'package:flutter/material.dart';

import '../../component/colors/genColors.dart';
import '../../component/text/genText.dart';

class DaftarRiwayat extends StatelessWidget {
  final Function() ontap;
  final String notrans;
  final String tanggal;
  final String total;
  final String status;

  const DaftarRiwayat(
      {Key? key,
      required this.ontap,
      required this.notrans,
      required this.tanggal,
      required this.status, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GenText(
              notrans,
              fontweight: FontWeight.bold,
              color: GenColors.primaryColor,
            ),
            GenText(tanggal),
            GenText("Total :"+total),
            GenText("status :"+status),
          ],
        ),
      ),
    );
  }
}
