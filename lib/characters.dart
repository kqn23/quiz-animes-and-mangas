class Character {
  String src;

  Character(String s) { src = s; }

  String getName() {
    return src.split('/')[1].split('.')[0];
  }

  String getImage() {
    return src;
  }
}

List<Character> allCharacters = [
  Character("assets/Black Clover.jpg"),
  Character("assets/Black Lagoon.jpg"),
  Character("assets/Boogie pop.jpg"),
  Character("assets/Dangaronpa.jpg"),
  Character("assets/Date Alive.jpg"),
  Character("assets/Domestic na kanojo.jpg"),
  Character("assets/Dororo.jpg"),
  Character("assets/Egao no daika.jpg"),
  Character("assets/Entre enfer et paradis.jpg"),
  Character("assets/Fairy Tail.jpg"),
  Character("assets/Fate Grand Order.jpg"),
  Character("assets/Fate Grand Order (2).jpg"),
  Character("assets/Freezing.jpg"),
  Character("assets/High School DxD.jpg"),
  Character("assets/High School of Dead.jpg"),
  Character("assets/High School of God.jpg"),
  Character("assets/Hinamatsuri.jpg"),
  Character("assets/Kengan Ashura.jpg"),
  Character("assets/Kimetsu no yaiba.jpg"),
  Character("assets/Kiss x Sis.jpg"),
  Character("assets/Koutetsuji no kabaneri.jpg"),
  Character("assets/Made in abyss.jpg"),
  Character("assets/Maken ki.jpg"),
  Character("assets/Medaka Box.jpg"),
  Character("assets/Monster musume.jpg"),
  Character("assets/My Hero Academy.jpg"),
  Character("assets/Nicky Larson.jpg"),
  Character("assets/One Piece.jpg"),
  Character("assets/Ooka-san.jpg"),
  Character("assets/Re-creators.jpg"),
  Character("assets/Re-Zero.jpg"),
  Character("assets/Seishun Buta no yarou.jpg"),
  Character("assets/Shokugeki no soma.jpg"),
  Character("assets/Solo Leveling.jpg"),
  Character("assets/Sword Art Online.jpg"),
  Character("assets/Tatei no yuusha.jpg"),
  Character("assets/To Love Ru.jpg"),
  Character("assets/Tower Of God.jpg"),
  Character("assets/Trinity Seven.jpg"),
  Character("assets/Tsugumomo.jpg"),
  Character("assets/watashi koi shinasai.jpg"),
  Character("assets/Yosuga no sora.jpg"),
  Character("assets/Yougo senki.jpg"),
];