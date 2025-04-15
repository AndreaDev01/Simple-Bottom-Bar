import 'package:flutter/cupertino.dart';

class MenuItem{
  final int index;
  final String text;
  final IconData icon;
  final Widget widget;

  MenuItem({required this.index,required this.text,required this.icon, required this.widget});
}