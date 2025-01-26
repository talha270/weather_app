import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utilis/widgets/custom_text.dart';

newsbox({required tem,required imagepath,required attime}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      customtext(text: tem,size: 18,color: Colors.white,wiegth: FontWeight.bold),
      // SizedBox(height: 5,),
      SizedBox(
        // color: Colors.red,
        height: Get.height*0.08,
        child: Image.asset(imagepath,fit: BoxFit.fill,),
      ),
      customtext(text: attime,size: 18,color: Colors.white,wiegth: FontWeight.bold),

    ],
  );
}