void main(List<String> args) {
  printHelloWorld();
  printStr(a: "赛文", b: "雷欧", c: "泰罗");
  printStr();
  printStr1("泰罗", "赛文");
  executeFunc(showName);
  executeFunc(showName1);
  executeFunc1(printCustom);
  // executeFunc1(showName1); // 报错
}

void printHelloWorld() {
  print("hello world");
}

void printStr({String? a, String? b, String? c = "奥特之父"}) {
  if (a != null) {
    print(a);
    return;
  }
  if (b != null) {
    print(b);
    return;
  }
  if (c != null) {
    print(c);
    return;
  }
}

void printStr1(String a, [String? b, String c = "奥特之母"]) {
  if (b == null) {
    print("$a,$c");
    return;
  }
  print("$a,$b,$c");
}

String getName() => "泰罗奥特曼";

void executeFunc(Function func) {
  func("泰罗奥特曼");
}

void showName(String name) {
  print(name);
}

Function showName1 = (String name) {
  print(name);
};

typedef Print = void Function(String, int);

void executeFunc1(Print func) {
  func("泰罗奥特曼", 12);
}

void printCustom(String name, int a) {
  print("$name,$a");
}
