import 'dart:async';

void main(List<String> args) {
  StreamController streamController = new StreamController(onListen: () {
    print("onListen");
  }, onPause: () {
    print("onPause");
  }, onResume: () {
    print("onResume");
  }, onCancel: () {
    print("onCancel");
  });
  StreamSubscription streamSubscription =
      streamController.stream.listen((date) {
    print(date);
  }, onDone: () {
    print("onDone");
  }, onError: (error) {
    print(error);
  });
  streamController.add(1);
  streamSubscription.pause();
  streamSubscription.resume();
  streamController.add(2);
  streamController.addError("error");
  streamController.add(3);
  streamController.close(); // onDone会执行
}
