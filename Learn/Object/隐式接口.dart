void main(List<String> args) {
  Dog dog = new Dog();
  dog.run();
  dog.showInformation();
  Run dog1 = new Dog();
  dog1.run();
}

abstract class Animation {
  void born() {
    print("我出生了啊！");
  }

  void showInformation();
}

class Run {
  void run() {
    print("我正在跑！");
  }
}

class Dog extends Animation implements Run {
  @override
  void run() {
    print("Dog正在奔跑");
  }

  @override
  void showInformation() {
    print("我是一只可爱的小狗狗");
  }
}
