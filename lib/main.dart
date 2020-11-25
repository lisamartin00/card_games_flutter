import 'package:flutter/material.dart';
import 'views/card_game_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Games',
      home: new CardGameList(),
    );
  }
}
