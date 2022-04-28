void main(List<String> args) {
  Person p1 = new Person.withAge(12);
  Person p2 = new Person.withName("aoteman");
  print("${p1.name}:${p1.age}");
  print("${p2.name}:${p2.age}");
}

class Person {
  int? age;

  String? name;

  Person(this.age, this.name);

  Person.withAge(int age) {
    this.age = age;
  }

  Person.withName(String name) {
    this.name = name;
  }
}
