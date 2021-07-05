import 'package:flutter/material.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey, blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'images/horse.png'}
];

List<Map> drawerItems=[
  {
    'icon': Icons.info,
    'title' : 'Info',
    'screenNumber' : 0
  },
  {
    'icon': Icons.add_box_rounded,
    'title' : 'Add Slots',
    'screenNumber' : 1
  },
  {
    'icon': Icons.medical_services,
    'title' : 'Add Doctor',
    'screenNumber' : 2
  },
  {
    'icon': Icons.favorite,
    'title' : 'Favorites'
  },
  {
    'icon': Icons.mail,
    'title' : 'Messages'
  },
  {
    'icon': Icons.ac_unit,
    'title' : 'Profile'
  },
];