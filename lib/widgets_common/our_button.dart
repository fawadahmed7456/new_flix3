import 'package:flutter/material.dart';
import 'package:new_flix_2/consts/consts.dart';

Widget ourButton(onPress, color, textColor, String title) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: onPress,
      child: title.text.color(textColor).size(16).bold.make());
}
