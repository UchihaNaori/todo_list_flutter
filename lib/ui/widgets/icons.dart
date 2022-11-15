import 'package:flutter/material.dart';
import '../../common/values/colors.dart';
import '../../common/values/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(IconData(personIcon, fontFamily: 'MaterialIcons'), color: purple,),
    Icon(IconData(workIcon, fontFamily: 'MaterialIcons'), color: blue,),
    Icon(IconData(shopIcon, fontFamily: 'MaterialIcons'), color: green,),
    Icon(IconData(travelIcon, fontFamily: 'MaterialIcons'), color: yellow,),
    Icon(IconData(movieIcon, fontFamily: 'MaterialIcons'), color: pink,),
    Icon(IconData(sportIcon, fontFamily: 'MaterialIcons'), color: deePink,),
  ];
}

List<String> title() => [
  'Person',
  'Work',
  'Shoppping',
  'Travel',
  'Movie',
  'Sport'
];