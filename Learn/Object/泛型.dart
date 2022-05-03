void main(List<String> args) {
  // 没做类型限制
  // Cache cacheStr = new Cache<String>("122");
  // print(cacheStr.value);
  // Cache cacheInt = new Cache<int>(122);
  // print(cacheInt.value);

  // 做了类型限制
  CacheDog cd = new CacheDog();
  Cache cacheDog = new Cache<CacheDog>(cd);
  print(cacheDog.value);

  String messageStr = showMessage<String>("122");
  int messageInt = showMessage<int>(12);
}

class Animaton {
  void born() {
    print("我出生了！");
  }
}

class Cache<T extends Animaton> {
  T _value;

  Cache(this._value);

  T get value {
    return _value;
  }

  set value(T v) {
    this._value = v;
  }
}

class CacheDog extends Animaton {
  void showMessage() {
    print("我是一只可爱的小狗狗");
  }
}

T showMessage<T>(T message) {
  return message;
}
