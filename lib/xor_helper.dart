String xorCrypt(String text, String key) {
  List<int> result = [];
  for (int i = 0; i < text.length; i++) {
    result.add(text.codeUnitAt(i) ^ key.codeUnitAt(i % key.length));
  }
  return String.fromCharCodes(result);
}