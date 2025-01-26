
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utilis/widgets/custom_text.dart';
import 'package:weather_app/utilis/widgets/newsbox.dart';
import 'package:weather_app/view/days_weather.dart';
import'package:intl/intl.dart' as intl;


todayweatherbox({required height,required data}){

  return Container(
    margin: EdgeInsets.only(left: 8,right: 8),
    height: height,
    width: double.infinity,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(colors: [
          Colors.purple.shade400,
          Colors.deepPurple.shade900,
        ],begin: Alignment.bottomLeft,end: Alignment.topCenter)),
    child: SingleChildScrollView(
      child: SizedBox(
        height: height-20,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: Get.width*0.07,),
                customtext(text: "Today",color: Colors.white,size: 16),
                Spacer(),
                customtext(text: "${intl.DateFormat.MMMMd().format(DateTime.now())}",color: Colors.white,size: 16),
                SizedBox(width: Get.width*0.04,),
              ],
            ),
            Divider(),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                newsbox(tem: "${data["current"]["temp_c"]} c",attime: "${data["current"]["condition"]["text"]}",imagepath: "assets/images/weather.png"),
                newsbox(tem: "${data["current"]["wind_kph"]} kph",attime: "Wind kph",imagepath: "assets/images/weather.png"),
                newsbox(tem: "${data["current"]["humidity"]}",attime: "humidity",imagepath: "assets/images/weather.png"),
                newsbox(tem: "${data["current"]["uv"]}",attime: "UV index",imagepath: "assets/images/weather.png"),
              ],
            ),
            Spacer(),
            Row(
              children: [
                customtext(text: "See More Details",color: Colors.white30,size: 16),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(DaysWeather());
                  },
                    child: Text("Click here",style: TextStyle(fontSize: 14,color: Colors.white70 ,decoration: TextDecoration.underline,decorationColor: Colors.white30),))

              ],
            )
          ],
        ),
      ),
    ),
  );
}