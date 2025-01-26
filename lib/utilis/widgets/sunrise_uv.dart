import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utilis/widgets/custom_text.dart';

sunriseanduv({required firsttext,required second,required three,required issunrise}){
  return Container(
    height: 150,
    width: Get.width*0.4,
    // child: ,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(colors: [
        Color(0xff3E2D8F),
        Colors.purple.shade400,
      ],begin: Alignment.topCenter,end: Alignment.bottomLeft),
      border: Border.all(color: Colors.white),
      boxShadow: [
        BoxShadow(color: Colors.white10,
        offset: Offset(8, 8),
          blurRadius: 10,
          spreadRadius: 10
        ),
      ]
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/icons/Star.png"),
              customtext(text: firsttext,size: 16,color: Colors.white70),
            ],
          ),
          SizedBox(height: 10,),
          customtext(text: second,size: 20,color: Colors.white,wiegth: FontWeight.bold),
          SizedBox(height: 5,),
          customtext(text: three,size:issunrise?18: 24,color:issunrise? Colors.white38:Colors.white,wiegth: FontWeight.bold),
        ],
      ),
    ),
  );
}