import 'package:flutter/material.dart';
import 'package:simple_bottom_bar/src/utils.dart';
import '../simple_bottom_bar.dart';


class BottomBar extends StatefulWidget {
  var on_change;
  int selected;
  List<MenuItem> widgets;
  TextStyle textStyle;
  Color background_color;
  BottomBar({required this.on_change, required this.selected, required this.widgets, this.textStyle = const TextStyle(), required this.background_color});

  @override
  State<BottomBar> createState() => _BottomBarState(this.on_change, this.selected, this.widgets, this.textStyle, this.background_color);
}

class _BottomBarState extends State<BottomBar> {
  var on_change;
  int selected;
  List<MenuItem> widgets;
  TextStyle titleStyle;
  Color background_color;
  _BottomBarState(this.on_change, this.selected, this.widgets, this.titleStyle, this.background_color);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        alignment: Alignment.center,
        height: heigth_bottom_bar,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [BoxShadow(
            color: background_color,
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
                  on_change(menu_item.index);
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
                      color: background_color,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(menu_item.icon, height: 25),
                        SizedBox(width: 15),
                        Text(menu_item.text, style: titleStyle),
                      ],
                    ),
                  )
                      : AnimatedContainer(
                    key: ValueKey("unselected_${menu_item.index}"),
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(10),
                    child: Image.asset(menu_item.icon, height: 30, width: 30),
                  ),
                ),
              );

            }).toList(),
          ),
        )
    );
  }
}