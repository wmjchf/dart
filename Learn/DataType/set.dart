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
