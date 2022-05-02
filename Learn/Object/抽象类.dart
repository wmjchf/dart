void main(List<String> args) {
  Bird bird = new Bird();
  Dog dog = new Dog();

  bird.showInformation();
  dog.showInformation();
}

abstract class Animation {
  void born() {
    print("我出生了啊！");
  }

  void showInformation();
}

class Bird extends Animation {
  @override
  void showInformation() {
    print("我是一只小小鸟");
    born();
  }
}

class Dog extends Animation {
  @override
  void showInformation() {
    print("我是一只可爱的狗狗");
    born();
  }
}
