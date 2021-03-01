import 'package:flutter/material.dart';
import '../data/card_games.dart';
import './card_game_detail.dart';
import './card_game_form.dart';

class CardGameList extends StatefulWidget {
  final CardGame newGame;

  CardGameList({Key key, this.newGame}) : super(key: key);

  @override
  _CardGameListState createState() => _CardGameListState(newGame: newGame);
}

class _CardGameListState extends State<CardGameList> {
  final CardGame newGame;

  _CardGameListState({Key key, this.newGame});

  List<CardGame> gameList = games();

  void _handleCardTap(CardGame game) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new CardGameDetail(game: game);
        },
      ),
    );
  }

  void _handleAddGameTap() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new CardGameForm();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasNewGame = newGame == null || false;
    if (hasNewGame) {
      setState(() {
        gameList.insert(0, newGame);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Games'),
      ),
      body: _buildCards(),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleAddGameTap,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildCards() {
    return Scrollbar(
      child: ListView(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            for (final game in games())
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: _buildCardGameItem(game),
              ),
          ]),
    );
  }

  Widget _buildCardGameItem(CardGame game) {
    // This height will allow for all the Card's content to fit comfortably within the card.
    const height = 270.0;

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
                child: InkWell(
                  onTap: () {
                    _handleCardTap(game);
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
