import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/component/button/roundedButton.dart';
import 'package:laundry_app/component/helper/JustHelper.dart';
import 'package:laundry_app/component/text/genText.dart';

class SuksesBayar extends StatelessWidget {
  const SuksesBayar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Pembayaran"),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              GenText(
                               "PEMBAYARAN BERHASIL",
                                fontSize: 20,
                                fontweight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(child: Icon(Icons.check_circle_rounded, color: Colors.green,size: 100,))
                            ],
                          ),
                        ),
                        RoundedButton(ontap: (){
                            Get.offAndToNamed("/home");
                        }, text: "Kembali ke Menu Utama", width: Size(double.infinity, 60), textColor: Colors.white,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
