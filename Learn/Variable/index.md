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
`Dart` 中定义常量也有两种方式，一种使用 `final` 关键字；另一种是Dart的方式，使用 `const` 关键字定义，都不能被重新赋值。
```
1、const常量，且声明时必须被初始化
const int g = 12;
print(g);
const i = DateTime.now(); // 报错，const是（编译时类型)
const int c; // 报错，The constant 'c' must be initialized.
c = 12;

2、final常量 (运行时常量)
final DateTime h = DateTime.now();
print(h);
```
