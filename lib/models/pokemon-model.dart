class Pokemon {
  final String name;
  final int id;
  final List<String> types;
  final String imageUrl;
  final int height; // in decimeters
  final int weight; // in hectograms
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  Pokemon(
      {
        required this.name,
        required this.id,
        required this.types,
        required this.imageUrl,
        required this.height,
        required this.weight,
        required this.hp,
        required this.attack,
        required this.defense,
        required this.specialAttack,
        required this.specialDefense,
        required this.speed,
      }
      );

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List<dynamic>).map((type) => type['type']['name'] as String).toList();
    final imageUrl = json['sprites']['other']['official-artwork']['front_default'] as String;
    final stats = json['stats'] as List<dynamic>;
    final hp = stats[0]['base_stat'] as int;
    final attack = stats[1]['base_stat'] as int;
    final defense = stats[2]['base_stat'] as int;
    final specialAttack = stats[3]['base_stat'] as int;
    final specialDefense = stats[4]['base_stat'] as int;
    final speed = stats[5]['base_stat'] as int;

    return Pokemon(
      name: json['name'] as String,
      id: json['id'] as int,
      types: types,
      imageUrl: imageUrl,
      height: json['height'] as int,
      weight: json['weight'] as int,
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
    );
  }
}
