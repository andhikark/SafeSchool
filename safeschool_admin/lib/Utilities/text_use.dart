import 'package:flutter/material.dart';


class TextUse {
  static TextStyle heading_1() {
    return const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle heading_2() {
    return const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle heading_3() {
    return const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle body() {
    return const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    );
  }
}
