import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Games',
      home: CardGameList(),
    );
  }
}

class CardGameList extends StatefulWidget {
  @override
  _CardGameListState createState() => _CardGameListState();
}

class _CardGameListState extends State<CardGameList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Games'),
      ),
      body: _buildCards(),
    );
  }

  Widget _buildCards() {
    return Scrollbar(
      child: ListView(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            for (final game in games(context))
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: CardGameItem(game: game),
              ),
          ]),
    );
  }
}

class CardGame {
  const CardGame({
    @required this.name,
    @required this.imgSrc,
    @required this.minAge,
    @required this.howToPlayUrl,
    @required this.requiresSpecialDeck,
    @required this.numPlayers,
  })  : assert(name != null),
        assert(imgSrc != null),
        assert(minAge != null),
        assert(howToPlayUrl != null),
        assert(requiresSpecialDeck != null),
        assert(numPlayers != null);

  final String name;
  final String imgSrc;
  final int minAge;
  final String howToPlayUrl;
  final bool requiresSpecialDeck;
  final String numPlayers;
}

List<CardGame> games(BuildContext context) => [
      CardGame(
        name: 'California Speed',
        imgSrc: 'assets/californiaSpeed.jpg',
        minAge: 7,
        howToPlayUrl:
            'https://www.itsalwaysautumn.com/play-california-speed-easy-card-game.html',
        requiresSpecialDeck: false,
        numPlayers: '2',
      ),
      CardGame(
        name: 'Canasta',
        imgSrc: 'assets/canasta.png',
        minAge: 12,
        howToPlayUrl: 'https://bicyclecards.com/how-to-play/canasta/',
        requiresSpecialDeck: false,
        numPlayers: '4',
      ),
      CardGame(
        name: 'Egyptian Rat Slap',
        imgSrc: 'assets/ers.jpg',
        minAge: 7,
        howToPlayUrl:
            'https://bicyclecards.com/how-to-play/egyptian-rat-screw/',
        requiresSpecialDeck: false,
        numPlayers: '2+',
      ),
      CardGame(
        name: 'FreeCell',
        imgSrc: 'assets/freeCell.jpg',
        minAge: 12,
        howToPlayUrl: 'http://www.solitairecity.com/Help/FreeCell.shtml',
        requiresSpecialDeck: false,
        numPlayers: '1',
      ),
      CardGame(
        name: 'Mau',
        imgSrc: 'assets/mau.jpeg',
        minAge: 8,
        howToPlayUrl: 'https://en.wikipedia.org/wiki/Mao_(card_game)',
        requiresSpecialDeck: false,
        numPlayers: '3+',
      ),
      CardGame(
        name: 'Nerts',
        imgSrc: 'assets/nerts.jpg',
        minAge: 12,
        howToPlayUrl: 'https://bicyclecards.com/how-to-play/nerts/',
        requiresSpecialDeck: false,
        numPlayers: '2+',
      ),
      CardGame(
        name: 'Phase 10',
        imgSrc: 'assets/phase10.jpg',
        minAge: 7,
        howToPlayUrl: 'https://www.instructables.com/How-to-Play-Phase-10/',
        requiresSpecialDeck: true,
        numPlayers: '2+',
      ),
      CardGame(
        name: 'Set',
        imgSrc: 'assets/set.jpg',
        minAge: 8,
        howToPlayUrl: 'https://www.setgame.com/set/puzzle_rules',
        requiresSpecialDeck: true,
        numPlayers: '1+',
      ),
      CardGame(
        name: 'SkipBo',
        imgSrc: 'assets/skipbo.jpg',
        minAge: 8,
        howToPlayUrl: 'https://service.mattel.com/instruction_sheets/42050.pdf',
        requiresSpecialDeck: true,
        numPlayers: '2+',
      ),
      CardGame(
        name: 'Sleeping Queens',
        imgSrc: 'assets/sleepingQueens.jpg',
        minAge: 5,
        howToPlayUrl:
            'https://www.fgbradleys.com/rules/rules4/Sleeping%20Queens%20-%20rules.pdf',
        requiresSpecialDeck: true,
        numPlayers: '2+',
      ),
      CardGame(
        name: 'Speed',
        imgSrc: 'assets/speed.jpg',
        minAge: 8,
        howToPlayUrl:
            'https://www.instructables.com/How-to-play-speed-card-game/',
        requiresSpecialDeck: false,
        numPlayers: '2',
      ),
      CardGame(
        name: 'Spit',
        imgSrc: 'assets/spit.jpg',
        minAge: 8,
        howToPlayUrl: 'https://bicyclecards.com/how-to-play/spit/',
        requiresSpecialDeck: false,
        numPlayers: '2',
      ),
      CardGame(
        name: 'Solitaire',
        imgSrc: 'assets/solitaire.png',
        minAge: 12,
        howToPlayUrl: 'https://bicyclecards.com/how-to-play/solitaire/',
        requiresSpecialDeck: false,
        numPlayers: '1',
      ),
      CardGame(
        name: 'Spoons',
        imgSrc: 'assets/spoons.png',
        minAge: 10,
        howToPlayUrl: 'https://bicyclecards.com/how-to-play/spoons/',
        requiresSpecialDeck: false,
        numPlayers: '3+',
      ),
      CardGame(
        name: 'War',
        imgSrc: 'assets/war.jpg',
        minAge: 5,
        howToPlayUrl: 'https://bicyclecards.com/how-to-play/war/',
        requiresSpecialDeck: false,
        numPlayers: '2+',
      ),
    ];

class CardGameItem extends StatelessWidget {
  const CardGameItem({Key key, @required this.game, this.shape})
      : assert(game != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 270.0;
  final CardGame game;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {
                    print('Card was tapped');
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: CardGameContent(game: game),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}

class CardGameContent extends StatelessWidget {
  const CardGameContent({Key key, @required this.game})
      : assert(game != null),
        super(key: key);

  final CardGame game;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final descriptionStyle = theme.textTheme.subtitle1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image(
                  image: AssetImage(game.imgSrc),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        // Description and share/explore buttons.
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // This array contains the three line description on each card
                // demo.
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(game.name),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Number of Players: ${game.numPlayers}',
                    style: descriptionStyle.copyWith(color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// return Scaffold(
//   appBar: AppBar(
//     // Here we take the value from the MyHomePage object that was created by
//     // the App.build method, and use it to set our appbar title.
//     title: Text(widget.title),
//   ),
//   body: Center(
//     // Center is a layout widget. It takes a single child and positions it
//     // in the middle of the parent.
//     child: Column(
//       // Column is also a layout widget. It takes a list of children and
//       // arranges them vertically. By default, it sizes itself to fit its
//       // children horizontally, and tries to be as tall as its parent.
//       //
//       // Invoke "debug painting" (press "p" in the console, choose the
//       // "Toggle Debug Paint" action from the Flutter Inspector in Android
//       // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//       // to see the wireframe for each widget.
//       //
//       // Column has various properties to control how it sizes itself and
//       // how it positions its children. Here we use mainAxisAlignment to
//       // center the children vertically; the main axis here is the vertical
//       // axis because Columns are vertical (the cross axis would be
//       // horizontal).
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           'You have pushed the button this many times:',
//         ),
//         Text(
//           '$_counter',
//           style: Theme.of(context).textTheme.headline4,
//         ),
//       ],
//     ),
//   ),
//   floatingActionButton: FloatingActionButton(
//     onPressed: _incrementCounter,
//     tooltip: 'Increment',
//     child: Icon(Icons.add),
//   ), // This trailing comma makes auto-formatting nicer for build methods.
