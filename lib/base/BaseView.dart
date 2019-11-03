import 'package:flutter/material.dart';

abstract class BaseView<T> {
  setPresenter(T presenter);
}
