class Character {
  String src;

  Character(String s) { src = s; }

  String getName() {
    return src.split('/')[2].split('.')[0];
  }

  String getImage() {
    return src;
  }
}

List<Character> allCharacters = [
  Character("assets/images/Black Clover.jpg"),
  Character("assets/images/Black Lagoon.jpg"),
  Character("assets/images/Boogie pop.jpg"),
  Character("assets/images/Dangaronpa.jpg"),
  Character("assets/images/Date Alive.jpg"),
  Character("assets/images/Domestic na kanojo.jpg"),
  Character("assets/images/Dororo.jpg"),
  Character("assets/images/Egao no daika.jpg"),
  Character("assets/images/Entre enfer et paradis.jpg"),
  Character("assets/images/Fairy Tail.jpg"),
  Character("assets/images/Fate Grand Order.jpg"),
  Character("assets/images/Fate Grand Order (2).jpg"),
  Character("assets/images/Freezing.jpg"),
  Character("assets/images/High School DxD.jpg"),
  Character("assets/images/High School of Dead.jpg"),
  Character("assets/images/High School of God.jpg"),
  Character("assets/images/Hinamatsuri.jpg"),
  Character("assets/images/Kengan Ashura.jpg"),
  Character("assets/images/Kimetsu no yaiba.jpg"),
  Character("assets/images/Kiss x Sis.jpg"),
  Character("assets/images/Koutetsuji no kabaneri.jpg"),
  Character("assets/images/Made in abyss.jpg"),
  Character("assets/images/Maken ki.jpg"),
  Character("assets/images/Medaka Box.jpg"),
  Character("assets/images/Monster musume.jpg"),
  Character("assets/images/My Hero Academy.jpg"),
  Character("assets/images/Nicky Larson.jpg"),
  Character("assets/images/One Piece.jpg"),
  Character("assets/images/Ooka-san.jpg"),
  Character("assets/images/Re-creators.jpg"),
  Character("assets/images/Re-Zero.jpg"),
  Character("assets/images/Seishun Buta no yarou.jpg"),
  Character("assets/images/Shokugeki no soma.jpg"),
  Character("assets/images/Solo Leveling.jpg"),
  Character("assets/images/Sword Art Online.jpg"),
  Character("assets/images/Tatei no yuusha.jpg"),
  Character("assets/images/To Love Ru.jpg"),
  Character("assets/images/Tower Of God.jpg"),
  Character("assets/images/Trinity Seven.jpg"),
  Character("assets/images/Tsugumomo.jpg"),
  Character("assets/images/watashi koi shinasai.jpg"),
  Character("assets/images/Yosuga no sora.jpg"),
  Character("assets/images/Yougo senki.jpg"),
];