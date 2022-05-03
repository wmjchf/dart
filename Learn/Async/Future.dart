void main(List<String> args) {
  print("开始执行");
  Future f1 = new Future(() {
    print("第一个future");
    return 1;
  });
  f1.then((res) {
    print("第二个future");
    print(res);
    return 2;
  }).then((res) {
    print("第三个future");
    print(res);
  });
  print("结束执行");
}
