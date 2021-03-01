import 'package:card_games_flutter/data/card_games.dart';
import 'package:flutter/material.dart';
import '../data/card_games.dart';
import './card_game_list.dart';

class CardGameForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Card Game'),
      ),
      body: CreateAGameForm(),
    );
  }
}

class CreateAGameForm extends StatefulWidget {
  @override
  CreateAGameFormState createState() {
    return CreateAGameFormState();
  }
}

class CreateAGameFormState extends State<CreateAGameForm> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String howToPlayUrl;
  String numPlayers;
  int minAge;
  bool doesRequireSpecialDeck = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name for your card game';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'How to Play Url'),
                  onChanged: (value) {
                    setState(() {
                      howToPlayUrl = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a URL';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Minimum Age'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      minAge = int.parse(value);
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a minimum age';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Number of Players'),
                  onChanged: (value) {
                    setState(() {
                      numPlayers = value;
                    });
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the number of players';
                    }
                    return null;
                  },
                ),
                SwitchListTile(
                  title: const Text('Requires a special deck?'),
                  value: doesRequireSpecialDeck,
                  onChanged: (value) {
                    setState(() {
                      doesRequireSpecialDeck = value;
                    });
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        final newGame = new CardGame(
                          name: name,
                          imgSrc: 'assets/defaultGame.jpg',
                          minAge: minAge,
                          howToPlayUrl: howToPlayUrl,
                          requiresSpecialDeck: doesRequireSpecialDeck,
                          numPlayers: numPlayers,
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return new CardGameList(newGame: newGame);
                            },
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
