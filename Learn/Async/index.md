# Dart 的异步编程

编程中的代码执行，通常分为同步与异步两种。

- 同步就是按照代码的编写顺序，从上到下依次执行。如果其中某一行或几行代码非常耗时，那么就会阻塞，使得后面的代码不能被立刻执行。
- 异步就是某部分耗时代码不在当前这条执行线路上立刻执行（不阻塞主线程代码的执行），而是交给其他的进程或者线程。

## 异步任务的两种方案

### 多线程

开辟另一条执行线，然后让耗时代码在另一条执行线上运行，这样两条执行线并列，耗时代码自然也就不能阻塞主执行线上的代码了。多线程虽然好用，但是在大量并发时，仍然存在两个较大的缺陷，一个是开辟线程比较耗费资源，线程开多了机器吃不消，另一个则是线程的锁问题，多个线程操作共享内存时需要加锁，复杂情况下的锁竞争不仅会降低性能，还可能造成死锁。

### 事件循环

在某个单线程中存在一个事件循环和一个事件队列，事件循环不断的从事件队列中取出事件来执行，这里的事件就好比是一段代码，每当遇到耗时的事件时，事件循环不会停下来等待结果，它会跳过耗时事件，继续执行其后的事件。当不耗时的事件都完成了，再来查看耗时事件的结果。因此，耗时事件不会阻塞整个事件循环，这让它后面的事件也会有机会得到执行。

种基于事件的异步模型，只适合 I/O 密集型的耗时操作，因为 I/O 耗时操作，往往是把时间浪费在等待对方传送数据或者返回结果，因此这种异步模型往往用于网络服务器并发。如果是计算密集型的操作，则应当尽可能利用处理器的多核，实现并行计算。

# Dart 的事件循环

Dart 是事件驱动的体系结构，该结构基于具有单个事件循环和两个队列的单线程执行模型。 Dart 虽然提供调用堆栈。 但是它使用事件在生产者和消费者之间传输上下文。 事件循环由单个线程支持，因此根本不需要同步和锁定。

Dart 的两个队列分别是：

- MicroTask queue 微任务队列
- Event queue 事件队列

Dart 事件循环执行如上图所示：

- 先查看 MicroTask 队列是否为空，不是则先执行 MicroTask 队列。
- 一个 MicroTask 执行完后，检查有没有下一个 MicroTask，直到 MicroTask 队列为空，才去执行 Event 队列。
- 在 Evnet 队列取出一个事件处理完后，再次返回第一步，去检查 MicroTask 队列是否为空。

将任务加入到 MicroTask 中可以被尽快执行，但也需要注意，当事件循环在处理 MicroTask 队列时，Event 队列会被卡住，应用程序无法处理鼠标单击、I/O 消息等等事件。

## 将任务添加到 MicroTask 队列有两种方法

1. 使用 scheduleMicrotask 方法添加

```
import 'dart:async';

void main(List<String> args) {
  print("开始执行");
  scheduleMicrotask(showMessage);
  print("结束执行");
}

void showMessage() {
  print("我是奥特曼，啊哈哈");
}
```

2. 使用 Future 对象添加

```
import 'dart:async';


void main(List<String> args) {
  print("开始执行");
  Future.microtask(showMessage);
  print("结束执行");
}

void showMessage() {
  print("我是奥特曼，啊哈哈");
}
```

## 将任务添加到 Event 队列

```
import 'dart:async';

import '../Object/泛型.dart';

void main(List<String> args) {
  print("开始执行");
  // scheduleMicrotask(showMessage);
  // 事件队列
  Future(showInformation);
  // 微任务队列
  Future.microtask(showMessage);
  print("结束执行");
}

void showMessage() {
  print("我是奥特曼，啊哈哈");
}

void showInformation() {
  print("我是迪迦奥特曼，哈哈啊");
}

```

<img width="520" alt="截屏2022-05-03 上午11 04 15" src="https://user-images.githubusercontent.com/36124772/166400105-ddf16e7e-0a77-44f3-b1bc-f87b3b81d480.png">

# Future

Future 类是对未来结果的一个代理。

```
void main(List<String> args) {
  print("开始执行");
  Future f1 = new Future(() {
    print("第一个future");
    return 1;
  });
  f1.then((res) {
    print("第二个future");
    print(res);
    return 2;
  }).then((res) {
    print("第三个future");
    print(res);
  });
  print("结束执行");
}
```
<img width="503" alt="截屏2022-05-03 上午11 33 51" src="https://user-images.githubusercontent.com/36124772/166402266-3e6681d7-24f4-40fe-be02-05e9bbb3559a.png">


# async 和 await

在 Dart1.9 中加入了 async 和 await 关键字，有了这两个关键字，我们可以更简洁的编写异步代码，而不需要调用 Future 相关的 API。将 async 关键字作为方法声明的后缀时，具有如下意义：

- 被修饰的方法会将一个 Future 对象作为返回值。
- 该方法会同步执行其中的方法的代码直到第一个 await 关键字，然后它暂停该方法其他部分的执行；
- 一旦由 await 关键字引用的 Future 任务执行完成，await 的下一行代码将立即执行。

```
void main(List<String> args) {
  print("main执行开始");
  testAsync();
  print("main执行结束");
}

Future<int> f1Future() {
  return new Future(() {
    return 1;
  });
}

Future<int> f2Future() {
  return new Future(() {
    return 2;
  });
}

void testAsync() async {
  print("testAsync执行开始");
  int date1 = await f1Future();
  int date2 = await f2Future();
  print(date1);
  print(date2);
  print("testAsync执行结束");
}

```
<img width="535" alt="截屏2022-05-03 上午11 42 09" src="https://user-images.githubusercontent.com/36124772/166402275-c05f3af8-a5ff-4d41-b7a1-391f0e3a91ff.png">

