void main(List<String> args) {
  Bird bird = new Bird();
  Dog dog = new Dog();
  bird.showInformation();
  dog.showInformation();
  dog.run();
  bird.fly();
}

abstract class Animation {
  void showInformation();
}

mixin Run {
  void run() {
    print("我正在跑！");
  }
}

mixin Fly {
  void fly() {
    print("我正在飞");
  }
}

class Bird extends Animation with Fly {
  @override
  void fly() {
    super.fly();
  }

  @override
  void showInformation() {
    print("我是一只小小鸟");
  }
}

class Dog extends Animation with Run {
  @override
  void showInformation() {
    print("我是一只可爱的狗狗");
  }

  @override
  void run() {
    super.run();
  }
}
