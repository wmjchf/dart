# 类型类型
在Dart中，内置类型有以下几种：`Numbers 数值`、`Strings 字符串`、`Booleans 布尔值`、`Lists 列表(数组)`、`Sets 集合`、`Maps 映射`、`Runes 符号字符`。在Dart中，所有能够使用变量引用的都是对象，每个对象都是一个类的实例。数字、函数和 null 也都是对象。所有的对象都继承于Object类。没有初始化的变量默认值为 null。数值类型变量的默认值也是 null。

## 数值类型(Numbers)
`num`、`int`,`double`都属于数值类型，其中`int`和`double`是`num`的子类。
```
int a = 12; // 整型 范围是-2^53至2^53之间
double b = 3.14 // (双精度) 浮点数 double则是64位的双精度浮点数
num c = 12; // 数值类型
num d = 3.14; // 数值类型

// 转换成字符串
int a = 12;
String str = a.toString();
// 字符串转换成数值类型
String str = "3.14"
double b = double.parse(str);
```
**注意：** 不规则字符串 to 数字类型 报错
```
  // Unhandled exception:
  // FormatException: Invalid radix-10 number (at character 1)
  try {
    String d = "hello12"; //or "12hello"
    int e = int.parse(d);
    print("${e}:${e.runtimeType}");
  } catch (e) {
    print(e);
  }
```
## 字符串(String)
- 可以使用单引号或者双引号来创建字符串。
```
String a = 'zhujiang';
String b = "zhujiang";
```
- 使用三引号（单引号或者双引号）来创建保留原有格式的多行字符串。
```
String multiLine1 = """你可以像这样，创建一个
包含了多行的字符串内容
""";
String multiLine2 = '''你也可以使用三个单引号，创建一个
包含了多行的字符串内容
''';
```
- 提供了插值表达式"${}", 也可以用于拼接字符串。
```
// 字符串拼接
String name = "奥特曼";
String aStr = "hello,${name}"; // 或者"hello,$name"，花括号可以省略
print(aStr); // hello,奥特曼

// 表达式
String name1 = "泰罗";
String name2 = "赛文";
String aStr = "hello,${true?name1:name2}"; // 花括号不能省略
print(aStr) // hello,泰罗
```
## 布尔类型(bool)
仅有false、true两个值，不能使用0、非0或者null、非null来表达false和true（与Javascrippt不同）。
```
bool isPass = true;
if(isPass){
    print("您已通过考核");
}
```
## 列表(List)
`List` 是一个元素不唯一的有序队列
- 创建列表
```
List list1 = [1,2,3];

List list2 = new List(3) // 已经废弃 
// This constructor cannot be used in null-safe code. Use [List.filled] to create a non-empty list. 
// This requires a fill value to initialize the list elements with. 
// To create an empty list, use [] for a growable list or List.empty for a fixed length list.
```
- 操作列表
```
void main() {
  List list1 = [];
  list1.add(12); // 新增
  print(list1);
  list1.remove(12); // 删除list中的数字，不是下标
  print(list1);
  list1.add(12);
  print(list1);
  list1.removeAt(0); // 下标，不存在会报错
  print(list1);
  list1.add(12);
  print(list1);
  list1[0] = 13; // 修改
  print(list1);
  bool isExist = list1.contains(14); // 查找，是否存在14这个数字 false
  print(isExist);
}
```
还有很多操作list的方法，这里就不一一列举了。
## 集合(Set)
`Set` 是一个元素唯一的有序队列
- 创建集合
```
// 字面量声明
Set set1 = {"abc", "def"};
// 构造函数
Set set = new Set();
```
- 操作集合
```
void main() {
  Set set = new Set();
  set.add(12); // 新增
  print(set); // {12}
  set.add(12);
  print(set); // 唯一 {12}
  set.remove(12); // 删除
  print(set);
  set.add(12);
  print(set);
  bool isExist = set.contains(12); // 查找，是否存在14这个数字 true
  print(isExist);
}

```

## 映射
- 创建映射
```
// 通过字面量
Map map = {"name": "wang", "age": 12};
// 构造函数
Map map = new Map();
```
- 操作映射
```
void main() {
  Map map1 = new Map();
  print(map1);
  map1["name"] = "wang"; // 新增
  print(map1);
  map1.remove("name");
  print(map1); // 删除
  map1["name"] = "wang";
  print(map1);
  map1["name"] = "奥特曼"; // 修改
  print(map1);
  print(map1["name"]); // 奥特曼
}
```
还有很多操作map的方法，这里就不一一列举了。
## 符号字符(Runes)
表示符文的意思，用于在字符串中表示Unicode字符。使用String.fromCharCodes显示字符图形。如果非4个数值，需要把编码值放到大括号中。
```
void main(List<String> args) {
  Runes runes = new Runes("\u{1f605} \u6211");
  var str1 = String.fromCharCodes(runes);
  print(str1);
}
```
直接可以打印出表情，有表情需求的可以直接使用Runes。
