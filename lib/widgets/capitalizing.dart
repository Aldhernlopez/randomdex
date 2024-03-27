String capitalize(String s) {
  //s = s.replaceAll("-", " "); // replace hyphens with spaces
  List<String> words = s.split("-"); // split string into words
  String firstWord = "${words[0][0].toUpperCase()}${words[0].substring(1)}";
  String restOfWords = "";
  if (words.length > 1) {
    //restOfWords = "${words.sublist(1).map((word) => "${word[0].toUpperCase()}${word.substring(1)}").join("-")}";
    restOfWords = words.sublist(1).map((word) => "${word[0].toUpperCase()}${word.substring(1)}").join("-");
  }
  return "$firstWord $restOfWords";
}