
import 'package:get/get.dart';
import 'package:laundry_app/entrance/daftar.dart';
import 'package:laundry_app/entrance/login.dart';
import 'package:laundry_app/entrance/unknownPage.dart';
import 'package:laundry_app/entrance/welcomePage.dart';
import 'package:laundry_app/pages/bayar.dart';
import 'package:laundry_app/pages/bayar2.dart';
import 'package:laundry_app/pages/detailPaket.dart';
import 'package:laundry_app/pages/keranjang.dart';

import 'entrance/splashScreen.dart';
import 'pages/detailRiwayat.dart';
import 'pages/homePage.dart';
import 'pages/suksesbayar.dart';

class RoutePage {

  List <GetPage>route = [
    GetPage(name: "/", page: () => SplashScreen()),
    GetPage(name: "/login", page: () => Login()),
    GetPage(name: "/unknown", page: () => UnknownPage()),
    GetPage(name: "/welcome", page: () => WelcomePage()),
    GetPage(name: "/home", page: () => HomePage()),
    GetPage(name: "/detail", page: () => DetailPaket()),
    GetPage(name: "/detailriwayat", page: () => DetailRiwayat()),
    GetPage(name: "/keranjang", page: () => Keranjang()),
    GetPage(name: "/daftar", page: () => Daftar()),
    GetPage(name: "/bayar", page: () => Bayar()),
    GetPage(name: "/bayar2", page: () => Bayar2()),
    GetPage(name: "/suksesbayar", page: () => SuksesBayar()),

  ];
}