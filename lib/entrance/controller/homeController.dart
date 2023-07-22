import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../component/req/request.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  GetStorage box = GetStorage();
  var dataReady = false.obs;
  var dataCart;
  final req = new GenRequest();
  var lengthCart = 0.obs;

  void LoadCart() async {
    dataReady.value = false;
    dataCart = await req.getApi("cart");
    print("data Cart  $dataCart");

    if (dataCart != null && dataCart["status"] == 200) {
      lengthCart.value = dataCart["payload"].length;
    }
    dataReady.value = true;

    // print("length" + dataLogin.length.toString());
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    // print("HC ON READY");
    // LoadCart();
  }

 }
