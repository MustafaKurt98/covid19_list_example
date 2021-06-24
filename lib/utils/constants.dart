import 'package:flutter/material.dart';

Color kPrimaryColor=Color(0xff34eb67);
Color kConfirmedColor=Color(0xffEC1212);
Color kActiveColor=Color(0xff121AEC);
Color kRecoveredColor=Color(0xff12EC82);
Color kDeathColor=Color(0xff7E7E7E);

LinearGradient kGradientShimmer=LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Colors.black,
    Colors.grey[100],
      
      ],
    );

RegExp regExp=new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc=(Match match)=> '${match[1]}.';