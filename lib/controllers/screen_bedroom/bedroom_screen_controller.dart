import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BedroomScreenController extends GetxController {
  late RxObjectMixin userSelectedLampColor;
  var lightName = ['Main Light', 'Desk Light', 'Bed Light'];
  var sceneNames = ['Birthday', 'Party', 'Relax', 'Fun'];

  /// using same icons for both beacuse icons are not available
  var lightIconsLight = ['assets/surface.svg', 'assets/furniture.svg', 'assets/bed_dark.svg'];
  var lightIconsDark = ['assets/surface1.svg', 'assets/furniture.svg', 'assets/bed_dark.svg'];

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

  @override
  void onInit() {
    super.onInit();
    userSelectedLampColor = colors[0].obs;
  }

  set setColor(index) => userSelectedLampColor.value = colors[index];
  set setOpacity(percent) => userSelectedLampColor.value = userSelectedLampColor.value.withOpacity(percent / 100);
}
