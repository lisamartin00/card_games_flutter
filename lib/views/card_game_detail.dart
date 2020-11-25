import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/card_games.dart';

class CardGameDetail extends StatelessWidget {
  final CardGame game;

  CardGameDetail({Key key, @required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchURL() async {
      await launch(game.howToPlayUrl);
    }

    final tiles = [
      ListTile(
        title: Text('How to Play'),
        trailing: Icon(Icons.link),
        onTap: _launchURL,
      ),
      ListTile(
        title: Text('Ages'),
        trailing: Text(game.minAge.toString() + '+'),
      ),
      ListTile(
        title: Text('Players'),
        trailing: Text(game.numPlayers),
      ),
      ListTile(
        title: Text('Special Deck?'),
        trailing: Icon(game.requiresSpecialDeck ? Icons.check_box : Icons.close,
            color: game.requiresSpecialDeck ? Colors.green : Colors.red[700]),
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: ListView(children: tiles),
    );
  }
}
