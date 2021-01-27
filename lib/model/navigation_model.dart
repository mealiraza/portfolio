import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData iconData;

  NavigationModel({this.title, this.iconData});
}

List<NavigationModel> navModel = [
  new NavigationModel(title: "HOME", iconData: Icons.home_outlined),
  new NavigationModel(title: "ABOUT", iconData: Icons.person_outline),
  new NavigationModel(title: "SKILLS", iconData: Icons.settings_outlined),
  new NavigationModel(
      title: "MY WORK", iconData: Icons.remove_red_eye_outlined),
  new NavigationModel(title: "CONTACT", iconData: Icons.contact_mail_outlined),
];
