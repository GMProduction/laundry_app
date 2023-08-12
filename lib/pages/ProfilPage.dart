import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:laundry_app/entrance/controller/profileController.dart';

import '../component/form/genTextField.dart';

class Profile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";
  String _phoneNumber = "";
  GetStorage box = GetStorage();

  var pc = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Obx(() => pc.dataReady.value
              ? Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-icon/user_318-159711.jpg'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Obx(
                              () => GenTextFieldRoundedBorder(
                                label: 'Nama',
                                hint: 'Masukan Nama',
                                init: pc.nama.value,
                                onChange: (val) {},
                              ),
                            ),
                            // SizedBox(height: 16.0),
                            // GenTextFieldRoundedBorder(
                            //   label: 'Alamat',
                            //   hint: 'Masukan Alamat',
                            //   onChange: (val) {},
                            // ),
                            // SizedBox(height: 16.0),
                            // GenTextFieldRoundedBorder(
                            //   label: 'No. Hp',
                            //   hint: 'Masukan Nomor HP',
                            //   onChange: (val) {},
                            // ),
                            SizedBox(height: 32.0),
                            Container(
                              width: double.infinity,
                              // make the container fill the parent widget's width
                              child: ElevatedButton(
                                onPressed: () {
                                  // do something when the button is pressed
                                  box.remove("token");
                                  // Get.toNamed("/bayar");
                                  Get.offAllNamed("/login");
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  // button color
                                  textStyle: TextStyle(fontSize: 16),
                                  // button text style
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        100.0), // button border radius
                                  ),
                                ),
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Text('Logout')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator()))),
    );
  }
}
