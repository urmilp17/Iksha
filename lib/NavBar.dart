import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

List<Widget> destinations() {
  return [
    NavigationDestination(
      selectedIcon: Icon(Icons.home,color: iconcolor,),
      icon: Icon(Icons.home_outlined),
      label: 'Home',

    ),
    NavigationDestination(
      icon: Badge(child: Icon(Icons.notifications_sharp,color: iconcolor )),
      label: 'Notifications',
    ),
    NavigationDestination(
      icon: Badge(
        label: Text('2'),
        child: Icon(Icons.messenger_sharp,color: iconcolor),
      ),
      label: 'Messages',
    ),
  ];
}