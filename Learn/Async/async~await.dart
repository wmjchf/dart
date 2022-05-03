void main(List<String> args) {
  print("main执行开始");
  testAsync();
  print("main执行结束");
}

Future<int> f1Future() {
  return new Future(() {
    return 1;
  });
}

Future<int> f2Future() {
  return new Future(() {
    return 2;
  });
}

void testAsync() async {
  print("testAsync执行开始");
  int date1 = await f1Future();
  int date2 = await f2Future();
  print(date1);
  print(date2);
  print("testAsync执行结束");
}
