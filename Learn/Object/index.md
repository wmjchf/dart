# 面向对象编程

面向对象，是相对于面向过程而言的。

## 面向过程编程

过程，就是步骤。有一个经典例子是这样的，如何把大象放进冰箱？
1、把冰箱门打开。
2、把大象放进冰箱。
3、把冰箱门关上。

```
void mian(){
    openDoor();
    put();
    closeDoor();
}
// 打开冰箱门
void openDoor(){}
// 把大象放进冰箱
void put(){}
// 把冰箱门关上
void closeDoor()
```

每一个步骤对应到代码其实就是一个函数，每一个函数实现一个功能，然后分步调用这些函数。函数实际上是一个黑盒模型，这个盒子是封闭的，我们不知道里面有什么，只知道这个盒子有一个入口和一个出口，就如同 ATM 机，我们把卡插到入口，另一边出口就冒钱出来了，至于具体的，钱是怎么冒出来的，这不是我们关心的。回到上面的例子，大象能不能放进冰箱，这也不是我们关心的，总之这个函数就是把大象放进冰箱的函数，只管调用它就好了。

有了这种面向过程的思维方式，编程就变得简单清晰有条理了，我们可以先把整个架子先搭起来，所有的函数先空实现，整个架子建好了，再慢慢去实现这一个个函数的具体细节。这跟建房子一样，先把钢结构架子搭起来，然后再慢慢码砖砌墙，最后才是室内装修。

随着软件业的发展，需求越来越复杂，人们发现面向过程的思维模型太简单了，已经无法胜任日益复杂的软件需求了，于是就出现了面向对象的思维方式。面向对象既是一种思维模型，也是一种代码的组织形式。

面向对象核心的载体是类和对象。

## 类

类是一种用户定义的类型，对具体事物的描述和抽象，每个类包含数据说明和一组操作数据或传递消息的函数。类的实例称为对象。

### 类的定义。

```
class Person {
  String name; // 属性--姓名

  int age; // 属性--年龄

  Person(this.name, this.age); // 构造函数，特殊的方法

  walk() {
    print("${this.name}正在走路");
  } // 行为--走路

  eat() {
    print("${this.name}正在吃饭");
  } // 行为--吃饭
}
```

类由三部分构成，`属性`、`方法`、 `构造函数`。

#### 构造函数

构造函数 ，是一种特殊的方法。主要用来在创建对象时初始化对象， 即为对象成员变量赋初始值，总与 new 运算符一起使用在创建对象的语句中。在 dart 中， Dart 构造函数主要分为四类，分别是 D`efault Constructors 默认构造函数`、`Named Constructors 命名构造函数`、C`onstant Constructors 常量构造函数`和 `Factory Constructors 工厂构造函数`。

##### 同名构造方法

如果没有定义构造方法，则会有一个默认的无参构造方法，并且会调用超类的无参构造方法。（与类名名称一样）

```
class Person {
  String name; // 属性--姓名

  int age; // 属性--年龄

  Person(this.name, this.age); // 构造函数，特殊的方法
}
```

##### 命名构造函数

Dart 类中两个同名构造方法不能重载，但是 Dart 语言为类新增了一种`命名构造`。

```
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
```

##### 常量构造方法

不会在内存中重复创建，节省开销。

```
void main(List<String> args) {
  const p1 = const Point(1, 1);
  const p2 = const Point(2, 2);
  const p3 = const Point(1, 1);
  print(identical(p1, p2));
  print(identical(p1, p3));
}

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);
}
```

##### 工厂构造方法

使用 factory 关键字标识类的构造函数将会令该构造函数变为工厂构造函数。`工厂构造函数不会自动生成实例,而是通过代码来决定返回的实例对象；工厂构造函数类似于 static 静态成员，无法访问 this 指针`。

```
void main(List<String> args) {
  Phone phone = new Phone.create();
  print(phone.branch);
  print(phone.size);
}

class Phone {
  int? size;

  String? branch;

  static Phone _cache = new Phone._(12, "xiaomi");

  Phone._(this.size, this.branch);

  factory Phone.create() {
    return Phone._cache;
  }
}
```

##### 构造函数重定向

有时候一个构造方法会调动类中的其他构造方法来实例化，这时候可以使用构造方法重定向。

```
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

```

#### 访问修饰符和 getter、setter

Dart 中没有像别的语言一样的修饰符例如 public，private.... ，也就是说，成员默认都是 public 的，如果需要在 Dart 中将一个属性或者方法定义成私有，需要在前面加`-`。
（需要注意的是，定义为私有属性和私有方法的类必须要抽离放在一个单独的文件中，然后才能真正起到私有的效果。）

```
// Person.dart
class Person {
  int _cardId;

  Person(this._cardId);

  int get cardId {
    return _cardId;
  }

  set cardId(int newValue) {
    this._cardId = newValue;
  }
}
// 访问修饰符.dart
import 'Person.dart';

void main(List<String> args) {
  Person p = new Person(0);
  print(p.cardId);
}
```

### 类的复用与抽象

#### 继承

在 Dart 中，使用 extens 继承一个类，子类会继承除了构造方法以外的属性和方法，dart 是单继承。

```
// 父类 Person.dart
class Person {
  int _cardId;

  Person(this._cardId);

  int get cardId {
    return _cardId;
  }

  set cardId(int newValue) {
    this._cardId = newValue;
  }

  void eat() {
    print("我是Person,我要吃饭，我饿！");
  }
}

// 子类 继承.dart
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
```

#### 抽象类

Dart 语言没有提供 interface 关键字来定义接口，但是 Dart 语言中保留了抽象类，抽象类使用 abstract 关键字来修饰，抽象类是不能被实例化的，子类继承抽象类时，必须实现全部抽象方法。

```
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

```

#### 隐式接口

实际上在 Dart 中，每个类都隐式的定义了一个包含所有实例成员的接口， 并且该类实现了这个接口。因此，如果我们想实现某个接口，但有又不想继承，则可以使用这种隐式接口机制。我们需要用到关键字 implements。

```
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

```

#### 混入

mixins 是要通过非继承的方式来复用类中的代码。

```
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

```
