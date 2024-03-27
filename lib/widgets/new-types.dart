import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomdex/widgets/capitalizing.dart';
import 'package:randomdex/widgets/type-chip-color.dart';

class NewPokemonTypes extends StatelessWidget {
  final List<String> types;

  const NewPokemonTypes({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    if (types.length <= 4) {
      return Row(
        children: types.map((type) => buildChip(type)).toList(),
      );
    } else {
      final firstRowTypes = types.sublist(0, 4);
      final secondRowTypes = types.sublist(4);

      return Column(
        children: [
          Row(
            children: firstRowTypes.map((type) => buildChip(type)).toList(),
          ),
          const SizedBox(height: 5), // Add spacing between rows
          Row(
            children: secondRowTypes.map((type) => buildChip(type)).toList(),
          ),
        ],
      );
    }
  }

  Widget buildChip(String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        shape: const StadiumBorder(
          side: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
        label: Text(
          capitalize(type),
          style: GoogleFonts.play(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: typeChipColor(type),
      ),
    );
  }
}
