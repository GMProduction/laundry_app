import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/entrance/controller/LoginController.dart';
import 'package:laundry_app/pages/component/daftarKeranjang.dart';

import '../component/button/roundedButton.dart';
import '../component/colors/genColors.dart';
import '../component/text/genText.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());

  var username;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      color: GenColors.primaryColor,
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                    child: Image.asset(
                  "assets/images/welcome.png",
                  height: 200,
                ))
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    GenText(
                      "Login",
                      fontweight: FontWeight.bold,
                      fontSize: 30,
                      color: GenColors.secondColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GenText(
                      "Masukan Username dan Password",
                      fontSize: 15,
                      color: GenColors.secondColor,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: TextField(
                        onChanged: (val) {
                          username = val;
                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.account_circle, size: 30),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade300)),
                          isDense: true,
                          labelText: "Username",
                          fillColor: Colors.grey.shade100,
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextField(
                        onChanged: (val) {
                          password = val;
                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock, size: 30),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.grey.shade300)),
                          isDense: true,
                          labelText: "Password",
                          fillColor: Colors.grey.shade100,
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                        onTap: () {
                          Get.toNamed("/daftar");
                        },
                        child: GenText(
                            "Jika belum punya akun, silahkan daftar disini")),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => controller.readytohit.value
                        ? RoundedButton(
                      ontap: () {
                        controller.MelakukanPenLoginan(
                            username, password);
                      },
                      bgColor: GenColors.secondColor,
                      width: Size(double.infinity, 50),
                      textColor: Colors.white,
                      text: "LOGIN",
                    )
                        : CircularProgressIndicator(
                      color: GenColors.secondColor,
                    )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
