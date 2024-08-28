import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

List<Widget> destinations() {
  return [
    NavigationDestination(
      tooltip: "Home Page",
      selectedIcon: Icon(
        Icons.home,
        color: iconcolor,
        size: 35,
      ),
      icon: const Icon(Icons.home_outlined,size: 30,),
      label: "",
    ),
    NavigationDestination(
      tooltip: "Main Features",
      selectedIcon: Icon(Icons.lightbulb, color: iconcolor,size: 35,),
      icon: Icon(Icons.lightbulb_outline, color: iconcolor,size: 30,),
      label: '',
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.article, color: iconcolor,size: 35,),
      tooltip: "Articles",
      icon: Icon(Icons.article_outlined, color: iconcolor,size: 30,),
      label: '',
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.female, color: iconcolor,size: 35,),
      tooltip: "Articles",
      icon: Icon(Icons.female_outlined, color: iconcolor,size: 30,),
      label: '',
    ),
  ];
}
