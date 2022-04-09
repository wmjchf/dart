void main() {
  // const导致的不可变性是可传递的
  // 相同的const常量不会在内存中重复创建
  const List a = [1, 2, 3];
  // a.add(4); // Unsupported operation: Cannot add to an unmodifiable list
  // a[1] = 5;
  // const Map b = {"name": "wang", "age": 12};
  // b["name"] = "ming"; // Unsupported operation: Cannot modify unmodifiable map
  const List b = [1, 2, 3];

  print(identical(a, b)); // true identical用于检查两个引用是否指向同一个对象

  // final导致的不可变性是不可传递的
  // 相同的final常量会在内存中重复创建
  final List c = [1, 2, 3];
  final List d = [1, 2, 3];
  c[0] = 12;
  print(identical(c, d)); // false
}
