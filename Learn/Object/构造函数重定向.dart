void main(List<String> args) {
  Person person = new Person.withAge(12);
  print("${person.age} ${person.name}");
}

class Person {
  int? age;

  String? name;

  Person(String name, int age) {
    this.name = name;
    if (age < 0) {
      this.age = 0;
    } else {
      this.age = age;
    }
  }

  Person.withAge(int age) : this("", age);
}
