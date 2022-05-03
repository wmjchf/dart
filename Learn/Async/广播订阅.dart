void main(List<String> args) {
  print("main开始执行");
  Future<int> f1 = new Future(() {
    return 1;
  });
  Future<int> f2 = new Future(() {
    return 2;
  });
  Stream<int> stream = Stream.fromFutures([f1, f2]).asBroadcastStream();

  stream.listen((date) {
    print(date);
  });
  stream.listen((date) {
    print(date);
  });
  print("main结束执行");
}
