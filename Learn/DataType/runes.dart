void main(List<String> args) {
  Runes runes = new Runes("\u{1f605} \u6211");
  var str1 = String.fromCharCodes(runes);
  print(str1);
}
