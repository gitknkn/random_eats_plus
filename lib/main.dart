import 'package:flutter/material.dart';

import 'screen/all_eats_screen.dart';
import 'screen/new_eats_screen.dart';
import 'screen/random_eats_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainScreen(),
      routes: <String, WidgetBuilder>{
        'screen/all_eats_screen': (BuildContext context) => AllEatsScreen(),
        'screen/new_eats_screen': (BuildContext context) => NewEatsScreen(),
        'screen/random_eats_screen': (BuildContext context) =>
            RandomEatsScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RandomEatsPlus'),
      ),
      drawer: Container(
        width: 180,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Drawer(
            child: ListView(
              children: [
                DrawerHeader(child: Text('どこに移動しますか？')),
                _createListTile(context, '写真一覧', 'screen/all_eats_screen'),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.shade100,
                ),
                child: Text(
                  'アプリ概要',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 64),
              _createButton(context, Icons.restaurant, 'RandomEatsPlusを開始する！',
                  'screen/new_eats_screen'),
              SizedBox(height: 32),
              _createButton(context, Icons.add_a_photo, '新しい写真を追加する！',
                  'screen/random_eats_screen'),
            ],
          ),
        ),
      ),
    );
  }

  /// 遷移用ボタン
  Widget _createButton(
      BuildContext context, IconData icon, String text, String routesName) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
      ),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.green.shade400,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(routesName);
      },
    );
  }

  /// Drawer用の遷移
  Widget _createListTile(
      BuildContext context, String pageName, String routesName) {
    return ListTile(
      title: Text(pageName),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(routesName);
      },
    );
  }
}
