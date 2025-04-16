import 'package:flutter/material.dart';
import 'package:simple_bottom_bar/src/utils.dart';
import '../simple_bottom_bar.dart';

/// A widget for implement the bottom bar
class BottomBar extends StatefulWidget {
  /// the action to execute on change
  final void Function(dynamic) onChange;
  /// the index selected
  final int selected;

  /// list of [MenuItem] to display
  final List<MenuItem> widgets;

  /// config for styling of bottomBar
  final BottomBarConfig bottomBarConfig;


  /// A widget for implement the bottom bar
  const BottomBar({super.key, required this.onChange, required this.selected, required this.widgets, required this.bottomBarConfig});

  @override
  State<BottomBar> createState() => _BottomBarState(this.onChange, this.selected, this.widgets, this.bottomBarConfig);
}

class _BottomBarState extends State<BottomBar> {
  final void Function(dynamic) onChange;
  int selected;
  List<MenuItem> widgets;
  BottomBarConfig bottomBarConfig;
  _BottomBarState(this.onChange, this.selected, this.widgets, this.bottomBarConfig);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        alignment: Alignment.center,
        height: heigthBottomBar,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [BoxShadow(
            color: bottomBarConfig.activeCardColor,
            offset: Offset(0, -2),
            blurRadius: 10,
          )],
        ),
        width: getWidth(context),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widgets.map((menu_item) {
              return GestureDetector(
                onTap: () {
                  onChange(menu_item.index);
                  setState(() {
                    selected = menu_item.index;
                  });
                },
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.horizontal,
                      child: child,
                    ),
                  ),
                  child: menu_item.index == selected
                      ? AnimatedContainer(
                    key: ValueKey("selected_${menu_item.index}"),
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    decoration: BoxDecoration(
                      color: bottomBarConfig.activeCardColor,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(menu_item.icon, size: 25, color: bottomBarConfig.activeIconColor,),
                        SizedBox(width: 15),
                        Text(menu_item.text, style: bottomBarConfig.textStyle),
                      ],
                    ),
                  )
                      : AnimatedContainer(
                    key: ValueKey("unselected_${menu_item.index}"),
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(10),
                    child: Icon(menu_item.icon, size: 30, color: bottomBarConfig.iconsColor,),
                  ),
                ),
              );

            }).toList(),
          ),
        )
    );
  }
}