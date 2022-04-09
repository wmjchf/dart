# 变量
`Dart` 中定义变量有两种方式，一种是静态类型语言常用的方式，显式指定变量类型，另一种则是动态语言的常用方式，不指定类型，由vm自动推断。
```
1、显示声明变量
String str = "hello world";
int number = 12;

2、不指定类型，由vm自动推断
var str = "hello world"
var number = 12;
str = number; // 编译报错

3、任意类型
dynamic str = "hello world";
int number = 12;
str = number; // 编译通过
dynamic不进行类型检查，可以是任意类型。

4、超类Object
Object str = "hello world"
int number = 12;
str = number; // 编译通过
在dart中，所有类型都是Object的子类。
```
# 常量
`Dart` 中定义常量也有两种方式，一种使用 `final` 关键字；另一种是Dart的方式，使用 `const` 关键字定义，都不能被重新赋值，这是它们唯一的相同点。
```
const int g = 12;
final DateTime h = DateTime.now();

g = 23; // 报错 Error: Can't assign to the const variable 'g'
h = DateTime.now(); // 报错 Error: Can't assign to the final variable 'h'

```
# final和const区别

  - `const`是编译时常量，`final`是运行时常量。
  
  ```
  const g = DateTime.now(); // 报错 Error: Cannot invoke a non-'const' constructor where a const expression is expected.
  final h = DateTime.now(); // 正常
  ```
  - `const`声明时必须被初始化，`final`非必须。
  
  ```
  const g;
  g = 12; // 报错 Error: The const variable 'g' must be initialized.
  final h;
  h = DateTime.now(); // 正常
  ```
  - `const`不可变性可传递，`final`不可传递。
  ```
  const List g = [1,2,3];
  g[0] = 12; // 报错 Unsupported operation: Cannot add to an unmodifiable list
  g.add(12); // 报错 Unsupported operation: Cannot add to an unmodifiable list
  final List h = [1,2,3];
  h[0] = 12; // 正常
  h.add(12); // 正常
  ```
  - 相同的`const`常量不会在内存中重复创建。
  ```
  const List g = [1, 2, 3];
  const List g1 = [1, 2, 3];
  print(identical(a, b)); // true identical用于检查两个引用是否指向同一个对象
  final List c = [1, 2, 3];
  final List d = [1, 2, 3];
  print(identical(c, d)); // false
  ```

