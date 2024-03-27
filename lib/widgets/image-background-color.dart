String getTypeColors(String type) {
  switch (type) {
    case 'bug':
      return '0xffDCE35B, 0xff45B649';
    case 'dark':
      return '0xff232526, 0xff414345';
    case 'dragon':
      return '0xff333333, 0xffdd1818';
    case 'electric':
      return '0xffF9CB13, 0xffF0F72A';
    case 'fairy':
      return '0xfff4c4f3, 0xfffc67fa';
    case 'fighting':
      return '0xffDD1818, 0xff333333';
    case 'fire':
      return '0xfff7b733, 0xfffc4a1a';
    case 'flying':
      return '0xff86fde8, 0xffacb6e5';
    case 'ghost':
      return '0xff9D50BB, 0xff6E48AA';
    case 'grass':
      return '0xff64E05C, 0xff95EA46';
    case 'ground':
      return '0xffD1913C, 0xffFFD194';
    case 'ice':
      return '0xff74ebd5, 0xffACB6E5';
    case 'normal':
      return '0xffABBAB, 0xffFFFFFF';
    case 'poison':
      return '0xffC6426E, 0xff642B73';
    case 'psychic':
      return '0xffFC5C7D, 0xff6A82FB';
    case 'rock':
      return '0xff1E1D1B, 0xffCC9934';
    case 'steel':
      return '0xff9bc5c3, 0xff616161';
    case 'water':
      return '0xff5B86E5, 0xff36D1DC';
    default:
      return '0xffCCCCCC, 0xff999999';
  }
}
