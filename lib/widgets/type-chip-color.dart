import 'package:flutter/material.dart';

Color typeChipColor(String type) {
  switch (type.toLowerCase()) {
    case 'normal':
      return const Color(0xffA9A9A9);
    case 'fire':
      return const Color(0xffFF4500);
    case 'water':
      return const Color(0xff00BFFF);
    case 'electric':
      return const Color(0xffFFFF00);
    case 'grass':
      return const Color(0xff7CFC00);
    case 'ice':
      return const Color(0xFFB0E0E6);
    case 'fighting':
      return const Color(0xFFB22222);
    case 'poison':
      return const Color(0xFF642B73);
    case 'ground':
      return const Color(0xffD1913C);
    case 'flying':
      return const Color(0xFF87CEEB);
    case 'psychic':
      return const Color(0xFFF85888);
    case 'bug':
      return const Color(0xff6B8E23);
    case 'rock':
      return const Color(0xffB8860B);
    case 'ghost':
      return const Color(0xFF9B30FF);
    case 'dragon':
      return const Color(0xFF8B0000);
    case 'dark':
      return const Color(0xff515A5A);
    case 'steel':
      return const Color(0xFF708090);
    case 'fairy':
      return const Color(0xffFF69B4);
    default:
      return Colors.grey;
  }
}
