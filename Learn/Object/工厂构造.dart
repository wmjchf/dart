void main(List<String> args) {
  Phone phone = new Phone.create();
  print(phone.branch);
  print(phone.size);
}

class Phone {
  int? size;

  String? branch;

  static Phone _cache = new Phone._(12, "xiaomi");

  Phone._(this.size, this.branch);

  factory Phone.create() {
    return Phone._cache;
  }
}
