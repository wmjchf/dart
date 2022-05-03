import 'dart:async';

import '../Object/泛型.dart';

void main(List<String> args) {
  print("开始执行");
  // scheduleMicrotask(showMessage);
  // 事件队列
  Future(showInformation);
  // 微任务队列
  Future.microtask(showMessage);
  print("结束执行");
}

void showMessage() {
  print("我是奥特曼，啊哈哈");
}

void showInformation() {
  print("我是迪迦奥特曼，哈哈啊");
}
