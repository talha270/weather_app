import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utilis/widgets/custom_text.dart';
import 'package:weather_app/utilis/widgets/newsbox.dart';
import 'package:weather_app/utilis/widgets/sunrise_uv.dart';
import 'package:weather_app/view_model/weathercontroller.dart';

class DaysWeather extends StatelessWidget {
  DaysWeather({super.key});
  final controller=Get.find<Weathercontroller>();
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
              Colors.purple.shade400,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child:FutureBuilder(future: controller.getforecast(), builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: Colors.white,),);
          }else{
            var data=snapshot.data!;
            return  SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Get.height*0.08,),
                  customtext(text: "${data["location"]["name"]},${data["location"]["region"]}",size: 23,color: Colors.white),
                  customtext(text: "Max: ${data["current"]["heatindex_c"]}     Min:${data["current"]["dewpoint_c"]}",size: 20,color: Colors.white),
                  SizedBox(height: Get.height*0.07,),
                  Container(
                    height: Get.height*0.75,
                    width: Get.width-40,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customtext(text: "7-Days Forecasts",color: Colors.white,size: 20,wiegth: FontWeight.bold),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  height: 200,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Colors.deepPurple.shade900,
                                        index==0?Colors.purple.shade400:Colors.white24
                                      ],begin: Alignment.topCenter,end: Alignment.bottomLeft),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child:Center(child:  newsbox(tem: "${data["forecast"]["forecastday"][index]["day"]["maxtemp_c"]} c", imagepath: "assets/images/weather.png", attime: "${DateFormat('EEEE').format(DateTime.parse(data["forecast"]["forecastday"][index]["date"]))}"),),
                                ),
                              );
                            },itemCount: data.length,),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Colors.deepPurple.shade900,
                                Colors.purple.shade400
                              ], begin: Alignment.topCenter, end: Alignment.bottomLeft)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/icons/target.png"),
                                    SizedBox(width: 15,),
                                    customtext(text: "AIR QUALITY",size: 16,color: Colors.white54)
                                  ],
                                ),
                                SizedBox(height: 10,),
                                customtext(text: "${data["current"]["wind_kph"]} kph - wind_dir: ${data["current"]["wind_dir"]}",size: 25,color: Colors.white,wiegth: FontWeight.bold),
                                SizedBox(height: 10,),
                                Container(
                                  height: 4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(70),
                                      gradient: LinearGradient(colors: [
                                        Color(0xff805BCA),
                                        Color(0xff362A84),
                                      ])
                                  ),
                                ),
                                SizedBox(height: 10,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height:Get.height*0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            sunriseanduv(firsttext: "SUNRISE",second: "${data["forecast"]["forecastday"][0]["astro"]["sunrise"]}",three: "Sunset: ${data["forecast"]["forecastday"][0]["astro"]["sunset"]}",issunrise: true),
                            sunriseanduv(firsttext: "UV index",second: "${data["current"]["uv"]}",three: "Moderate",issunrise: false),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },)
      ),
    );
  }
}
