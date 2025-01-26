import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utilis/widgets/custom_text.dart';
import 'package:weather_app/view_model/weathercontroller.dart';

import '../utilis/widgets/todayweather_box.dart';

class SingleDayWeather extends StatelessWidget {
   SingleDayWeather({super.key});
  final controller=Get.put(Weathercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple.shade900,
              Colors.purple.shade400
            ], begin: Alignment.topCenter, end: Alignment.bottomLeft)),
        child:FutureBuilder(future: controller.gettodayweather(), builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: Colors.white,),);
          }else{
            Map data=snapshot.data!;
            return Column(
              children: [
                SizedBox(height: Get.height*0.03,),
                SizedBox(
                    height: Get.height*0.2,
                    child: Image.asset("assets/images/weather.png")),
                SizedBox(height: 5,),
                customtext(text: "${data["current"]["temp_c"]} c",color: Colors.white,size: 40,wiegth: FontWeight.bold),
                customtext(text: "${data["location"]["name"]},${data["location"]["region"]}",color: Colors.white,size: 20),
                customtext(text: "Max: ${data["forecast"]["forecastday"][0]["day"]["maxtemp_c"]}     Min:${data["forecast"]["forecastday"][0]["day"]["mintemp_c"]}",color: Colors.white,size: 20),
                SizedBox(height: Get.height*0.05,),
                SizedBox(
                    height: Get.height*0.2,
                    child: Image.asset("assets/images/House.png")),
                todayweatherbox(height: Get.height*0.3,data:data),
              ],
            );
          }
        },)
      ),
    );
  }
}
