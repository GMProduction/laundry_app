import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/button/roundedButton.dart';
import '../component/colors/genColors.dart';
import '../component/text/genText.dart';
import 'controller/welcomePageController.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WelcomePageController wpc = Get.put(WelcomePageController());

    return Scaffold(
      body: Container(
        color: GenColors.primaryColor,
        child: Column(
          children: [
            Expanded(child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Image.asset(wpc.onst[wpc.onstate.value]["image"], height: 150,),),
                    SizedBox(height: 15,),
                    Obx(() => AnimatedContainer(duration: Duration(milliseconds: 300),child: Container(margin: EdgeInsets.symmetric(horizontal: 16),child: GenText(wpc.onst[wpc.onstate.value]["judul"], fontSize: 25, fontweight: FontWeight.bold, color: GenColors.lightColor, textAlign: TextAlign.center )))),
                    SizedBox(height: 10,),
                Obx(() =>Container(margin: EdgeInsets.symmetric(horizontal: 16), child: GenText(wpc.onst[wpc.onstate.value]["isi"], color: Colors.white, textAlign: TextAlign.center,)),)
                  ],
            ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(padding: EdgeInsets.symmetric(horizontal: 20),height:  50, child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Obx(() => thedot(number: 0, thestate: wpc.onstate.value)),
                        Obx(() => thedot(number: 1, thestate: wpc.onstate.value)),
                        Obx(() => thedot(number: 2, thestate: wpc.onstate.value)),
                      ],)
                    ],
                  ),
                ),),

                Container(
                  margin:  EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() => wpc.onstate == 0 ? Container() : RoundedButton(ontap: (){
                        wpc.decrement();
                      }, text: "Prev", textColor: Colors.white, width: Size(50,30)),),

                      Obx(() => wpc.onstate == 0 ? Container() : Text("|", style: TextStyle(color: Colors.white),) ,),
                      Obx(() => RoundedButton(ontap: (){
                        wpc.onstate.value != 2 ? wpc.increment() : Get.toNamed("/login") ;
                      }, text: wpc.onstate.value != 2 ? "Next" : "Finish", textColor: Colors.white, width: Size(50,30)) ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class thedot extends StatelessWidget {
  final int number;
  final int thestate;

  const thedot({required this.number, required this.thestate});


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: number == thestate ? 15 : 10,
      height: number == thestate ? 15 : 10,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: number == thestate ? GenColors.secondColor : GenColors.lightColor,
        ),
        margin: EdgeInsets.only(right: 5), duration: Duration(milliseconds: 300, ),
    );
  }
}

