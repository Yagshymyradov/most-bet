import 'package:flutter/material.dart';

extension BuildContextX on BuildContext{
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}