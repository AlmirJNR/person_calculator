import 'package:flutter/widgets.dart';

class HomeController {
  HomeController({required this.title, this.counterMaxLimit = 10, this.counterMinLimit = 0});

  final String title;

  ValueNotifier<int> counter = ValueNotifier<int>(0);
  int counterMaxLimit;
  int counterMinLimit;

  bool get isEmpty => counter.value <= 0;
  bool get isFull => counter.value >= counterMaxLimit;

  String canShopReceiveNewClients(int value) {
    if (value >= counterMaxLimit) {
      return 'This shop is full, you cannot enter anymore';
    }

    return 'This shop is accepting new customers';
  }

  Function()? canIncrement(int value) {
    if (value >= counterMaxLimit) {
      return null;
    }

    return () {
      counter.value++;
    };
  }

  Function()? canDecrement(int value) {
    if (value <= counterMinLimit) {
      return null;
    }

    return () {
      counter.value--;
    };
  }
}
