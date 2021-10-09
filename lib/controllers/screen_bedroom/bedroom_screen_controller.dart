import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BedroomScreenController extends GetxController {
  RxInt selectColor = 0.obs;
  late Color userSelectedColor;

  late RxObjectMixin userColor;

  @override
  void onInit() {
    super.onInit();
    userSelectedColor = colors[0];
    userColor = colors[0].obs;
  }

  var colors = const [
    Color.fromRGBO(255, 155, 155, 1),
    Color.fromRGBO(148, 235, 158, 1),
    Color.fromRGBO(148, 202, 235, 1),
    Color.fromRGBO(165, 148, 235, 1),
    Color.fromRGBO(222, 148, 235, 1),
    Color.fromRGBO(235, 208, 148, 1),
    Color.fromRGBO(255, 255, 255, 1),
  ];

  var gradientColors = const [
    [
      Color.fromRGBO(255, 155, 155, 1),
      Color.fromRGBO(255, 185, 146, 1),
    ],
    [
      Color.fromRGBO(166, 147, 235, 1),
      Color.fromRGBO(213, 147, 235, 1),
    ],
    [
      Color.fromRGBO(147, 202, 235, 1),
      Color.fromRGBO(147, 219, 235, 1),
    ],
    [
      Color.fromRGBO(137, 221, 148, 1),
      Color.fromRGBO(186, 234, 146, 1),
    ]
  ];

  var sceneNames = ['Birthday', 'Party', 'Relax', 'Fun'];

  set setColor(index) => userColor.value = colors[index];
  set setOpacity(percent) => userColor.value = userColor.value.withOpacity(percent / 100);

  RxObjectMixin getColor(index) {
    userColor.value = colors[index];
    return userColor;
  }

  RxObjectMixin changeOpacity(percent) {
    return userColor.value.withOpacity(percent / 100).obs;
  }
}
