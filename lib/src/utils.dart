import 'package:flutter/cupertino.dart';

/// The heigth container of bottom bar
double heigthBottomBar = 80;
/// return the Heigth of screen
getHeigth(BuildContext context){
  return MediaQuery.of(context).size.height;
}
/// return the width of Screen
getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}