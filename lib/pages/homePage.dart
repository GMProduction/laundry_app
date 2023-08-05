import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/component/text/genText.dart';
import 'package:laundry_app/entrance/controller/homeController.dart';
import 'package:laundry_app/pages/riwayat.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entrance/controller/cartController.dart';
import 'ProfilPage.dart';
import 'beranda.dart';

class HomePage extends StatelessWidget with WidgetsBindingObserver {
  var hc = Get.put(HomeController());

  String title = "";

  final List<Widget> _children = [
    Home(),
    Riwayat(),
    Profile(),
  ];

  String theTitle(int index) {
    if (index == 0) {
      title = "Paket yang tersedia";
    } else if (index == 1) {
      title = "Riwayat";
    } else {
      title = "Profil";
    }

    return title;
  }

  void onTabTapped(int index) {
    hc.currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    hc.LoadCart();
    theTitle(hc.currentIndex.value);
    return MaterialApp(
      title: 'Judul Aplikasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Obx(() => GenText(
                    theTitle(hc.currentIndex.value),
                    color: Colors.white,
                    fontSize: 16,
                  )),
              actions: [
                hc.currentIndex.value == 0
                    ? Badge(
                        label: Obx(() => Text(hc.lengthCart.value.toString())),
                        alignment: AlignmentDirectional.bottomStart,
                        child: IconButton(
                          icon: const Icon(Icons.shopping_cart),
                          onPressed: () {
                            Get.toNamed("/keranjang")
                                ?.then((value) => Get.delete<CartController>());
                          },
                        ),
                      )
                    : Container(),
              ],
            ),
            body: Obx(() => _children[hc.currentIndex.value]),
            floatingActionButton: FloatingActionButton.small(
                child: Image.asset("assets/images/wa.png", color: Colors.white),
                backgroundColor: Colors.green,
                onPressed: () {
                  _launchWhatsapp();
                }),
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                currentIndex: hc.currentIndex.value,
                onTap: onTabTapped,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'Riwayat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profil",
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

_launchWhatsapp() async {



  var url = Uri.parse("https://wa.me/?text=Hey buddy, try this super cool new app!");
  await canLaunchUrl(url)
      ? await  launchUrl(url,
      mode: LaunchMode.externalApplication)
      :
    throw 'Could not launch $url';
  }
