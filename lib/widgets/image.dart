import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:randomdex/widgets/image-background-color.dart';

class PokemonImage extends StatelessWidget {

  final String url;
  final String type;

  const PokemonImage({super.key, required this.url, required this.type});

  @override
  Widget build(BuildContext context) {
    final typeColors = getTypeColors(type);
    final colors = typeColors.split(', ').map((color) => Color(int.parse(color))).toList();
    final color1 = colors[0];
    final color2 = colors[1];

    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              color1,
              color2,
            ],
        ),
          border: Border.all(
            width: 1
          ),
          borderRadius: BorderRadius.circular(50),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: FadeInImage(
            placeholder: const AssetImage('assets/images/load.gif'),
            image: NetworkImage(url),
          fadeInDuration: const Duration(milliseconds: 200),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
