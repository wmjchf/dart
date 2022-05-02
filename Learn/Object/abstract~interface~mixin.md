# 说在前面

代码复用是面向对象技术带来的很棒的潜在好处之一。复用代码的方式有很多种，代码复用的最大好处在于它可以减少你的代码量，也就潜在地减小了开放和维护成本。坏处则在于你自己应用的能力范围就被约束住了，而且也增加了应用和被复用代码之间的耦合，所以在构建应用的时候恰当地应用它们是非常重要。

# 常见的复用方式

## 继承复用

继承复用指的是在你的应用里面使用继承技术，以获取被继承类已经具备的行为，进而从对已有类的利用中获得优势。继承是面向对象核心基础的概念之一，适用于模型中“is a”这样的关系。

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

继承复用的好处在于你可以充分利用以前实现过的行为，减少开发时间，也就减少了你完成整个应用的开销。在继承复用中有一种特别的复用方式————模板(abstract)复用。

模板(abstract)复用就是在抽象类中定义了一系列基本操作，可以是具体的，也可以是抽象的，每一个基本操作对应算法的一个步骤，在其子类中可以重定义或实现这些步骤。同时，在抽象类中实现了一个模板方法，用于定义一个算法的框架，模板方法不仅可以调用在抽象类中实现的基本方法，也可以调用在抽象类的子类中实现的基本方法。

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

在继承结构中，父类的内部细节对于子类是可见的。所以我们通常也可以说通过继承的代码复用是一种白盒式代码复用。（如果基类的实现发生改变，那么派生类的实现也将随之改变。这样就导致了子类行为的不可预知性；）

### 组合(interface)复用

组合(Composition)体现的是整体与部分、拥有的关系，即 has-a 的关系。

```
/**
 * 接口：能飞的
 */
public interface Volitant {

    void fly();
}

/**
 * 鸟
 */
public class Bird extends Animal implements Volitant {

    @Override
    public void fly() {
        System.out.println("I can fly");
    }
}

/**
 * 蝙蝠
 */
public class Bat extends Animal implements Volitant {

    @Override
    public void fly() {
        System.out.println("I can fly");
    }
}
```

组合是通过对现有的对象进行拼装（组合）产生新的、更复杂的功能。因为在对象之间，各自的内部细节是不可见的，所以我们也说这种方式的代码复用是黑盒式代码复用。（因为组合中一般都定义一个类型，所以在编译期根本不知道具体会调用哪个实现类的方法）

### 总结

`继承`，在写代码的时候就要指名具体继承哪个类，所以，在编译期就确定了关系。（从基类继承来的实现是无法在运行期动态改变的，因此降低了应用的灵活性。）。

`组合`，在写代码的时候可以采用面向接口编程。所以，类的组合关系一般在运行期确定。

## abstract 和 interface 的区别

- 语法层面，这里不细说。
- 设计层面（核心）
  1）抽象类是对一种事物的抽象，即对类抽象，而接口是对行为的抽象。抽象类是对整个类整体进行抽象，包括属性、行为，但是接口却是对类局部（行为）进行抽象。举个简单的例子，飞机和鸟是不同类的事物，但是它们都有一个共性，就是都会飞。那么在设计的时候，可以将飞机设计为一个类 Airplane，将鸟设计为一个类 Bird，但是不能将 飞行 这个特性也设计为类，因此它只是一个行为特性，并不是对一类事物的抽象描述。此时可以将 飞行 设计为一个接口 Fly，包含方法 fly( )，然后 Airplane 和 Bird 分别根据自己的需要实现 Fly 这个接口。然后至于有不同种类的飞机，比如战斗机、民用飞机等直接继承 Airplane 即可，对于鸟也是类似的，不同种类的鸟直接继承 Bird 类即可。从这里可以看出，继承是一个 "是不是"的关系，而 接口 实现则是 "有没有"的关系。如果一个类继承了某个抽象类，则子类必定是抽象类的种类，而接口实现则是有没有、具备不具备的关系，比如鸟是否能飞（或者是否具备飞行这个特点），能飞行则可以实现这个接口，不能飞行就不实现这个接口。

  2）设计层面不同，抽象类作为很多子类的父类，它是一种模板式设计。而接口是一种行为规范，它是一种辐射式设计。什么是模板式设计？最简单例子，大家都用过 ppt 里面的模板，如果用模板 A 设计了 ppt B 和 ppt C，ppt B 和 ppt C 公共的部分就是模板 A 了，如果它们的公共部分需要改动，则只需要改动模板 A 就可以了，不需要重新对 ppt B 和 ppt C 进行改动。而辐射式设计，比如某个电梯都装了某种报警器，一旦要更新报警器，就必须全部更新。也就是说对于抽象类，如果需要添加新的方法，可以直接在抽象类中添加具体的实现，子类可以不进行变更；而对于接口则不行，如果接口进行了变更，则所有实现这个接口的类都必须进行相应的改动。

  下面看一个网上流传最广泛的例子：门和警报的例子：门都有 open( )和 close( )两个动作，此时我们可以定义通过抽象类和接口来定义这个抽象概念：

  ```
  abstract class Door {
    public abstract void open();
    public abstract void close();
  }
  ```

  或者

  ```
  interface Door {
    public abstract void open();
    public abstract void close();
  }
  ```

  但是现在如果我们需要门具有报警 alarm( )的功能，那么该如何实现？下面提供两种思路：
  1）将这三个功能都放在抽象类里面，但是这样一来所有继承于这个抽象类的子类都具备了报警功能，但是有的门并不一定具备报警功能；

  2）将这三个功能都放在接口里面，需要用到报警功能的类就需要实现这个接口中的 open( )和 close( )，也许这个类根本就不具备 open( )和 close( )这两个功能，比如火灾报警器。

  从这里可以看出， Door 的 open() 、close()和 alarm()根本就属于两个不同范畴内的行为，open()和 close()属于门本身固有的行为特性，而 alarm()属于延伸的附加行为。因此最好的解决办法是单独将报警设计为一个接口，包含 alarm()行为,Door 设计为单独的一个抽象类，包含 open 和 close 两种行为。再设计一个报警门继承 Door 类和实现 Alarm 接口。

  ```
  interface Alram {
    void alarm();
  }
  abstract class Door {
    void open();
    void close();
  }
  class AlarmDoor extends Door implements Alarm {
    void oepn() {
      //....
    }
    void close() {
      //....
    }
    void alarm() {
      //....
    }
  }
  ```

  [参考文章 1————看透面向对象的复用技术](https://www.raychase.net/777)、[参考文章 2————Java 中代码复用技术](https://www.cnblogs.com/yysy/p/13358228.html)、[参考文章 3————深入理解 Java 的接口和抽象类 ](https://www.cnblogs.com/dolphin0520/p/3811437.html)

# dart 中的 mixin

mixins 是要通过非继承的方式来复用类中的代码，类似于上面的`interface`。

## 为什么我们需要 Mixin

我们这里有一个名为 Animal 的超类，它有三个子类（Mammal，Bird 和 Fish）。在底部，我们有具体的一些子类。 小方块代表行为。例如，蓝色方块表示具有此行为的类的实例可以 swim。

有些动物有共同的行为：猫和鸽子都可以行走，但是猫不能飞。 这些行为与此分类正交，因此我们无法在超类中实现这些行为。

如果一个类可以拥有多个超类，那就很容易办到了。我们可以创建另外三个类：Walker，Swimmer，Flyer。在那之后，我们只需从 Walker 类继承 Dove 和 Cat。但在 Dart 中，每个类（除了 Object 类）都只有一个超类。

我们可以通过实现 Walker 接口，而不是继承自 Walker 类，因为它是一个接口，但我们必须在`多个类中实现行为`，因此它并不是一个好的解决方案。（这个是 mixin 和 interface 最大的区别）

我们需要一种在多个类层次结构中重用类的代码的方法。 Mixin 就能够办到这一点！

## 什么时候应该使用 Mixin

当我们想要在不共享相同类层次结构的多个类之间共享行为时，或者在超类中实现此类行为没有意义时，Mixins 非常有用。
