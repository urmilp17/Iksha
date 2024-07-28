import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

List<Widget> destinations() {
  return [
    NavigationDestination(
      selectedIcon: Icon(
        Icons.home,
        color: iconcolor,
      ),
      icon: const Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Badge(
        child: Icon(Icons.lightbulb, color: iconcolor),
      ),
      label: 'Main Features',
    ),
    NavigationDestination(
      icon: Badge(
        child: Icon(Icons.article, color: iconcolor),
      ),
      label: 'Articles',
    ),
  ];
}
