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
