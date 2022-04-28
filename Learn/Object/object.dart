void main(List<String> args) {
  Person person1 = new Person("泰罗", 12);

  Person person2 = new Person("赛文", 13);

  person2.walk();

  person1.eat();
}

class Person {
  String name;

  int age;

  Person(this.name, this.age);

  walk() {
    print("${this.name}正在走路");
  }

  eat() {
    print("${this.name}正在吃饭");
  }
}
