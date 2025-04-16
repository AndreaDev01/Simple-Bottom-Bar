import 'package:flutter/cupertino.dart';

/// Menu item of bottom bar
class MenuItem{
  /// index of item
  final int index;
  /// text disoplay on the item
  final String text;

  /// icon display on the item
  final IconData icon;

  /// The widget that is open when the index was selected
  final Widget widget;

  /// Menu item of appbar, is required the fields index, text, icon and widget
  MenuItem({required this.index,required this.text,required this.icon, required this.widget});
}