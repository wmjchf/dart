# 函数
在Dart中，函数（或方法） 也是对象，它的类型是 Function。 这意味着，函数可以赋值给变量，也可以当做其他函数的参数。

## 基本使用
函数由三部分构成，方法名 , 参数 , 返回值 ;

**返回值类型 :**

① 缺省 : 返回值类型可以缺省 ;

② 空类型 : 返回值类型可以设置为 void ;

③ 真实类型 : 返回值类型可以设置为真实的数据类型 ;

**方法名 :**

① 匿名方法 : 不需要方法名 ;

② 普通方法 : 除匿名方法之外的其它方法都需要方法名 ;

**参数 :**

① 组成 : 参数包括 参数类型 , 参数名 ;

② 类型缺省 : 参数类型可以缺省 ;

③ 参数分类 : 可选参数 , 默认参数 ;

```
void main(List<String> args) {
  printHelloWorld();
}

void printHelloWorld() {
  print("hello world");
}
```

## 参数
Dart中支持两种可选参数：
- 命名可选参数
- 位置可选参数
### 命名可选参数
```
// 可以设置参数默认值
void printStr({String? a, String? b, String? c = "奥特之父"}) {
  if (a != null) {
    print(a);
    return;
  }
  if (b != null) {
    print(b);
    return;
  }
  if (c != null) {
    print(c);
    return;
  }
}

printStr(a: "赛文", b: "雷欧", c: "泰罗"); // 赛文
printStr(); // 奥特之父
```
### 位置可选参数
```
void printStr1(String a, [String? b, String c = "奥特之母"]) {
  if (b == null) {
    print("$a,$c");
    return;
  }
  print("$a,$b,$c");
}
printStr1("泰罗"); // 泰罗,奥特之母
printStr1("泰罗", "赛文"); // 泰罗,赛文,奥特之母
```
**注意：**
命名可选参数与位置可选参数的区别，前者中的参数与顺序无关，无需按顺序传参，且传参数时需使用冒号；后者与顺序相关，传参必须依照顺序。

## 箭头函数
```
String getName() => "泰罗奥特曼";
```

## 函数类型和函数签名
### 函数类型
```
void executeFunc(Function func) {
  func("泰罗奥特曼");
}

void showName(String name) {
  print(name);
}
// 或者
Function showName1 = (String name) {
  print(name);
};

// 将函数作为参数传递
executeFunc(showName); // 泰罗奥特曼
executeFunc(showName1); // 泰罗奥特曼
```
我们可以声明函数类型变量，并将函数作为参数传递。
### 函数签名
直接使用Function类型来声明函数变量做形式参数，是无法检查该函数的形式参数的，而且这样代码可读性太差，我们无法获知该函数变量的形式参数声明信息。这时候，就需要使用关键字typedef来定义函数的签名。**公式：typedef 函数类型别名 = 函数签名 typedef F = void Function(String);**
```
typedef Print = void Function(String, int);

void executeFunc1(Print func) {
  func("泰罗奥特曼", 12);
}

void printCustom(String name, int a) {
  print("$name,$a");
}

executeFunc1(printCustom);
executeFunc1(showName1); // 报错，函数参数不一致
```