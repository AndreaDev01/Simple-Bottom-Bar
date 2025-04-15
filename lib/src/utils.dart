import 'package:flutter/cupertino.dart';
double height_appbar = 120;
double heigth_bottom_bar = 80;

getHeigth(BuildContext context){
  return MediaQuery.of(context).size.height;
}

getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

getHeightContainer(BuildContext context){
  return (getHeigth(context) - height_appbar - heigth_bottom_bar) - 20;
}