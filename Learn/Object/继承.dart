import 'Person.dart';

void main(List<String> args) {
  Student student = new Student(0);
  print(student.cardId);
  student.eat();
}

class Student extends Person {
  Student(int cardId) : super(cardId);

  @override
  void eat() {
    super.eat();
    print("我是Student, 我要吃饭");
  }
}
