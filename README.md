# 📱 simple_bottom_bar

A clean and customizable bottom navigation bar for Flutter applications.

**simple_bottom_bar** is designed to be lightweight, easy to use, and ideal for apps that need a beautiful and simple bottom bar with minimal setup.

---

## ✨ Features

- Simple and elegant design
- Easy to integrate and customize
- Built-in support for navigation items
- Lightweight and efficient
- Custom icons and color themes

---

## 🚧 Current Limitations

- Currently supports up to **3 items**
- Support for **4 and 5 items** is **coming soon**

---

## 📦 Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  simple_bottom_bar:
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Usage

Here's a quick example of how to use `simple_bottom_bar`:

```dart
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
        widgets: widgets,
        bottomBarConfig: BottomBarConfig(
            active_card_color: Colors.blue.withOpacity(0.5),
            icons_color: Colors.blue.withOpacity(0.5),
            active_icon_color: Colors.white, textStyle: TextStyle(color: Colors.white)),
    );
  }
}

```

---

## 🔮 Roadmap

- [ ] Support for 4 and 5 items
- [ ] Add animations and transitions
- [ ] Improved accessibility and responsiveness

---

## 📝 License

This project is licensed under the MIT License.

---

Made with ❤️ by [Andrea Salvatore](https://andreasalvatoredeveloper.it/)
