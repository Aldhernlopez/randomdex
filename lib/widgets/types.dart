import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomdex/widgets/capitalizing.dart';
import 'package:randomdex/widgets/type-chip-color.dart';

class PokemonTypes extends StatelessWidget {

  final List<String> types;

  const PokemonTypes({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: types.map((type){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Chip(
            shape: const StadiumBorder(
              side: BorderSide(
                width: 2,
                color: Colors.black
              )
            ),
            label: Text(capitalize(type),
            style: GoogleFonts.play(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              )
            )
            ),
            backgroundColor: typeChipColor(type),
          ),
        );
      }).toList(),
    );
  }
}
