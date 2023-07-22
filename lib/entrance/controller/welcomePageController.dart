import 'package:get/get.dart';

class WelcomePageController extends GetxController{
  var onstate = 0.obs;
  final int max = 2;

  final List onst = [{
    "image":"assets/images/bersih_wangi.png",
    "judul":"Bersih dan Wangi",
    "isi":"Pakaian dijamin bersih dan selalu wangi"
  },
    {
      "image":"assets/images/fast.png",
      "judul":"2 Jam Pengerjaan",
      "isi":"Pakaianmu akan bisa dipakai lagi dalam waktu hanya 2 jam saja"
    },{
      "image":"assets/images/delivery.png",
      "judul":"Pengiriman untuk area Surakarta",
      "isi":"Pengiriman khusus untuk area Surakarta"
    },

  ];

  increment() {
    if(onstate < max){
      onstate++;
    }
  }
  decrement()
  {
    if(onstate > 0){
      onstate--;
    }
  }
}