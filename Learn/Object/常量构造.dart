void main(List<String> args) {
  const p1 = const Point(1, 1);
  const p2 = const Point(2, 2);
  const p3 = const Point(1, 1);
  print(identical(p1, p2));
  print(identical(p1, p3));
}

class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);
}
