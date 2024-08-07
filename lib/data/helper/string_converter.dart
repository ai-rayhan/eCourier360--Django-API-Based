String getFirstCharactersOfWords(String input) {
  List<String> words = input.split(" ");
  String result = words.map((word) => word[0]).join("");
  return result;
}