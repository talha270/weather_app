import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utilis/widgets/custom_text.dart';
import 'package:weather_app/view/single_day_weather.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepPurple.shade900,
          // Colors.deepPurple.shade900,
          // Color(0xffEE80D2),
          Colors.purple.shade400
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: -10,
              child: SizedBox(
                  height: Get.height * 0.4,
                  child: Image.asset("assets/images/weather.png")),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Positioned(
              top: Get.height * 0.55,
              child: customtext(
                  text: "Weather",
                  size: 62,
                  color: Colors.white,
                  wiegth: FontWeight.bold),
            ),
            Positioned(
              top: Get.height * 0.62,
              child: customtext(
                  text: "ForeCasts",
                  size: 64,
                  color: Color(0xffDDB130),
                  wiegth: FontWeight.bold),
            ),
            Positioned(
              top: Get.height * 0.8,
              child: SizedBox(
                  height: 60,
                  width: Get.width * 0.7,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffDDB130)),
                      onPressed: () {
                        Get.to(SingleDayWeather());
                      },
                      child: Text(
                        "Get Start",
                        style: TextStyle(
                            color: Color(0xff362A84),
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
