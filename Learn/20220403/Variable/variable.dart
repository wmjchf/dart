
void main(){
  // 整型
  int a = 10;
  print(a);
  // 浮点型
  double b = 3.12;
  print(b);
  // 数字类型
  num n = 12;
  print(n);
  // 字符串
  String c = "hello world";
  print(c);
  // 布尔值
  bool f = true;
  print(f);
  // 类型推断，当 d = c时，报错
  var d = 12;
  print(d);
  // 任意类型，可以把任意值赋给它
  dynamic e = 13;
  print(e);
  // const常量
  const g = 12;
   print(g);
  // 下面代码报错，const是（编译时类型)
  //const i = DateTime.now();
 
  // final常量 (运行时常量)
  final h = DateTime.now();
  print(h);

  
  
  
  
}