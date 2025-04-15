import 'package:flutter/material.dart';
import 'package:simple_bottom_bar/src/menu_item.dart';

import '../simple_bottom_bar.dart';

class AppContainer extends StatefulWidget {
  AppBar? appBar;
  List<MenuItem> widgets;
  BottomBarConfig bottomBarConfig;

  AppContainer({super.key, required this.widgets, this.appBar = null, required this.bottomBarConfig});

  @override
  State<AppContainer> createState() => _AppContainerState(this.widgets, this.appBar, this.bottomBarConfig);
}

class _AppContainerState extends State<AppContainer> {
  AppBar? appBar;
  List<MenuItem> widgets;
  BottomBarConfig bottomBarConfig;

  _AppContainerState(this.widgets, this.appBar, this.bottomBarConfig);

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
              }, selected: index_selected, widgets: widgets,
                bottomBarConfig: bottomBarConfig,
              ),
            )
          ],
        ),
      ),
    );
  }
}
