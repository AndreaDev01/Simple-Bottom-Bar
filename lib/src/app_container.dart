import 'package:flutter/material.dart';
import '../simple_bottom_bar.dart';

/// A container widget that wraps an [AppBar], a list of [MenuItem] pages,
/// and a custom [BottomBar] for navigation.
class AppContainer extends StatefulWidget {
  /// Optional [AppBar] displayed at the top of the screen.
  final AppBar? appBar;
  /// The list of [MenuItem] widgets to display in the body based on navigation.
  final List<MenuItem> widgets;
  /// Configuration options for the bottom bar style and behavior.
  final BottomBarConfig bottomBarConfig;

  /// Creates an [AppContainer] with navigation and layout options.
  const AppContainer({super.key, required this.widgets, this.appBar, required this.bottomBarConfig});

  @override
  State<AppContainer> createState() => _AppContainerState(this.widgets, this.appBar, this.bottomBarConfig);
}

class _AppContainerState extends State<AppContainer> {
  AppBar? appBar;
  List<MenuItem> widgets;
  BottomBarConfig bottomBarConfig;

  _AppContainerState(this.widgets, this.appBar, this.bottomBarConfig);

  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: config.getColorOpacity(),
      appBar: appBar,
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widgets[indexSelected].widget,
            Container(
              color: Colors.white,
              child: BottomBar(onChange: (index){
                setState(() {
                  indexSelected = index;
                });
              }, selected: indexSelected, widgets: widgets,
                bottomBarConfig: bottomBarConfig,
              ),
            )
          ],
        ),
      ),
    );
  }
}
