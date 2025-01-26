import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:location/location.dart';


class Weathercontroller extends GetxController{
  var location; // Location instance
  var ispermissioned=false.obs;

  @override
  void onInit() {
    super.onInit();
    _getUserLocation();

  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await Location().serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Location().requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check for location permissions
    permissionGranted = await Location().hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await Location().requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get the user's current location
    location = await Location().getLocation();

    ispermissioned.value=true;
  }

  Future<Map> gettodayweather()async{
    var response=await http.get(Uri.parse("${dotenv.env["base_url"]}${dotenv.env["forecast_weather"]}?key=${dotenv.env["api_key"]}&q=${ispermissioned.value?location.latitude!.toString()+","+location.longitude!.toString():"lahore"}"));
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      Get.snackbar("Alert Box", "Try again");
      return jsonDecode(response.body);
    }
  }


  Future<Map> getforecast()async{
    var response=await http.get(Uri.parse("${dotenv.env["base_url"]}${dotenv.env["forecast_weather"]}?key=${dotenv.env["api_key"]}&q=${ispermissioned.value?location.latitude!.toString()+","+location.longitude!.toString():"lahore"}&days=7"));
    if(response.statusCode==200){
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    }else{
      // print(jsonDecode(response.body));
      Get.snackbar("Alert Box", "Try again");
      return jsonDecode(response.body);
    }
  }
}
