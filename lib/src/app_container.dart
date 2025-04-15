import 'package:flutter/material.dart';
import 'package:simple_bottom_bar/src/menu_item.dart';

import '../simple_bottom_bar.dart';

class AppContainer extends StatefulWidget {
  AppBar? appBar;
  List<MenuItem> widgets;
  TextStyle textStyle;
  Color backgroundColor;

  AppContainer({super.key, required this.widgets, required this.backgroundColor, this.textStyle = const TextStyle(), this.appBar = null});

  @override
  State<AppContainer> createState() => _AppContainerState(this.widgets, this.backgroundColor, this.textStyle, this.appBar);
}

class _AppContainerState extends State<AppContainer> {
  AppBar? appBar;
  List<MenuItem> widgets;
  TextStyle textStyle;
  Color backgroundColor;

  _AppContainerState(this.widgets, this.backgroundColor, this.textStyle, this.appBar);

  int index_selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: config.getColorOpacity(),
      appBar: appBar,
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widgets[index_selected].widget,
            Container(
              color: Colors.white,
              child: BottomBar(on_change: (index){
                setState(() {
                  index_selected = index;
                });
              }, selected: index_selected, widgets: widgets, background_color: this.backgroundColor, textStyle: this.textStyle,),
            )
          ],
        ),
      ),
    );
  }
}
