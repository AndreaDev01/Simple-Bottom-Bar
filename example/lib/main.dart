import 'package:flutter/material.dart';
import 'package:simple_bottom_bar/simple_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Bottom bar example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Simple bottom bar example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<MenuItem> widgets =[
    MenuItem(index: 0, text: "Home Page", icon: Icons.home, widget: Container(child: Text("Home page"),)),
    MenuItem(index: 1, text: "Account", icon: Icons.people, widget: Container(child: Text("Account"),)),
    MenuItem(index: 2, text: "Settings", icon: Icons.settings, widget: Container(child: Text("Settings"),)),
  ];

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Simple bottom bar example", style: TextStyle(color: Colors.white),),
      ),
        widgets: widgets,
        bottomBarConfig: BottomBarConfig(
            activeCardColor: Colors.blue.withOpacity(0.5),
            iconsColor: Colors.blue.withOpacity(0.5),
            activeIconColor: Colors.white, textStyle: TextStyle(color: Colors.white)),
    );
  }
}
