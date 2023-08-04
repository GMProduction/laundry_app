import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/component/button/roundedButton.dart';
import 'package:laundry_app/component/helper/JustHelper.dart';
import 'package:laundry_app/component/text/genText.dart';

class Bayar2 extends StatelessWidget {
  const Bayar2({Key? key}) : super(key: key);

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
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenText(
                               Get.parameters["id"] == "1" ? "Payment Using Gopay" :
                               Get.parameters["id"] == "2" ? "Payment Using Bank VT" : "Paymen Using Credit Card",
                                fontSize: 20,
                                fontweight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                Get.parameters["id"] == "1" ?  "assets/images/gopay.png" :
                                Get.parameters["id"] == "2" ?  "assets/images/bank.png" : "assets/images/credit.png",
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                        RoundedButton(ontap: (){

                        }, text: "Pay", width: Size(double.infinity, 60), textColor: Colors.white,)
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
