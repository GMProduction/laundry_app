import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/component/helper/JustHelper.dart';
import 'package:laundry_app/component/text/genText.dart';

class Bayar extends StatelessWidget {
  const Bayar({Key? key}) : super(key: key);

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
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.black12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GenText("Total"),
                      GenText(formatRupiahUseprefik("10000"),
                          fontSize: 20, fontweight: FontWeight.bold),
                      GenText("Order ID"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GenText(
                        "All Payment Method",
                        fontSize: 20,
                        fontweight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                Get.toNamed("/bayar2?id=1");
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GenText(
                                      "Gopay",
                                      fontSize: 16,
                                      fontweight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset("assets/images/gopay.png", height: 30,),
                                        Icon(Icons.chevron_right_outlined)
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Get.toNamed("/bayar2?id=2");
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    GenText(
                                      "Virtual Account Bank",
                                      fontSize: 16,
                                      fontweight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset("assets/images/bank.png", height: 30,),
                                        Icon(Icons.chevron_right_outlined)
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Get.toNamed("/bayar2?id=3");
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    GenText(
                                      "Credit Card",
                                      fontSize: 16,
                                      fontweight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset("assets/images/credit.png", height: 30,),
                                        Icon(Icons.chevron_right_outlined)
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
