class Person {
  int _cardId;

  Person(this._cardId);

  int get cardId {
    return _cardId;
  }

  set cardId(int newValue) {
    this._cardId = newValue;
  }

  void eat() {
    print("我是Person,我要吃饭，我饿！");
  }
}
