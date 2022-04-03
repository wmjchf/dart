void main() {
  // 数值类型
  int a = 2022;
  print(a.runtimeType);

  // 数值类型 to 字符串
  String b = a.toString();
  print(b.runtimeType);

  // 字符串 to 数字类型
  int c = int.parse(b);
  print(c.runtimeType);

  // 不规则字符串 to 数字类型 报错
  // Unhandled exception:
  // FormatException: Invalid radix-10 number (at character 1)
  try {
    String d = "hello12"; //or "12hello"
    int e = int.parse(d);
    print("${e}:${e.runtimeType}");
  } catch (e) {
    print(e);
  }

  // 浮点型 to 字符串
  double z = 6.4342434343;
  String y = z.toStringAsFixed(3);
  print("${y}-${y.runtimeType}");
}
