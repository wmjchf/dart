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
