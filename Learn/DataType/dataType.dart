void main() {
  // 数值类型
  int a = 2022;
  double money = 3.14;
  num number = 300;
  print("------数值类型------");
  print("${a.runtimeType}-${money.runtimeType}-${number.runtimeType}");

  // 字符串
  String str = "hello world";
  print("------字符串------");
  print(str.runtimeType);

  // 布尔
  bool isUse = true;
  print("------布尔------");
  print(isUse.runtimeType);

  // List
  List list = ["hello", 12, true];
  list.add("world");
  list.add(23);
  list[0] = "奥特曼";
  print("------List------");
  print(list);
  print(list.runtimeType);

  // Map
  Map map = {"name": "奥特曼", "age": 12, "sex": "male"};
  map["name"] = "假面超人";
  print("------Map------");
  print(map);
  print(map.runtimeType);

  // 数值类型 to 字符串
  String b = a.toString();
  print("------数值类型 to 字符串------");
  print(b.runtimeType);

  // 字符串 to 数字类型
  int c = int.parse(b);
  print("------字符串 to 数字类型------");
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
