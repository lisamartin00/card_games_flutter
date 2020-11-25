class CardGame {
  const CardGame({
    this.name,
    this.imgSrc,
    this.minAge,
    this.howToPlayUrl,
    this.requiresSpecialDeck,
    this.numPlayers,
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

List<CardGame> games() => [
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
