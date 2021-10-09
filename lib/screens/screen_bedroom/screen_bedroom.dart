import 'package:animated_widgets/animated_widgets.dart';
import 'package:ashutosh21rdfpp/controllers/screen_bedroom/bedroom_screen_controller.dart';
import 'package:ashutosh21rdfpp/widgets/colors_picker.dart';
import 'package:ashutosh21rdfpp/widgets/horizontal_buttons.dart';
import 'package:ashutosh21rdfpp/widgets/intensity_slider.dart';
import 'package:ashutosh21rdfpp/widgets/scense.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BedroomScreen extends StatelessWidget {
  final controller = Get.put(BedroomScreenController());
  BedroomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 77, 162, 1),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/ic_bulb.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/ic_home.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/ic_settings.svg'),
            label: '',
          ),
        ],
      ),
      body: Stack(
        children: [
          /// Background circle
          Positioned(
            top: -80.h,
            left: -130.w,
            height: 500.h,
            child: RotationAnimatedWidget.tween(
              enabled: true,
              rotationDisabled: Rotation.deg(),
              rotationEnabled: Rotation.deg(z: -30, x: 0),
              child: Transform.rotate(
                angle: 22.6.r,
                child: SvgPicture.asset('assets/circles.svg'),
              ),
            ),
          ),

          Positioned(
            right: 78.5.w,
            top: 140.h,
            child: TranslationAnimatedWidget.tween(
              enabled: true,
              delay: const Duration(seconds: 1),
              translationDisabled: const Offset(0, -50),
              translationEnabled: const Offset(0, 0),
              child: Obx(() {
                return Container(
                  height: 27.h,
                  width: 27.w,
                  decoration: BoxDecoration(
                    color: controller.userColor.value,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: controller.userColor.value,
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),

          Positioned(
            right: 30.w,
            top: -55.h,
            child: TranslationAnimatedWidget.tween(
              enabled: true,
              delay: const Duration(seconds: 1),
              translationDisabled: const Offset(0, -50),
              translationEnabled: const Offset(0, 0),
              child: SvgPicture.asset('assets/lamp.svg'),
            ),
          ),

          Positioned(
            top: 200.h,
            left: 20.w,
            child: DelayedDisplay(
              delay: const Duration(milliseconds: 500),
              slidingBeginOffset: const Offset(5, 0.0),
              fadeIn: true,
              fadingDuration: const Duration(seconds: 1),
              child: HorizontalButtons(
                onClick: (index) {},
                activeIndex: 1,
              ),
            ),
          ),

          Positioned(
            top: 70.h,
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: () => Get.back(), icon: SvgPicture.asset('assets/ic_back.svg')),
                        Expanded(
                          child: Text(
                            'Bed\nRoom',
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TranslationAnimatedWidget.tween(
                    enabled: true,
                    translationDisabled: const Offset(0, -50),
                    translationEnabled: const Offset(0, 0),
                    child: OpacityAnimatedWidget.tween(
                      enabled: true,
                      opacityDisabled: 0,
                      opacityEnabled: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 55.w),
                        child: Text(
                          '4 Lights',
                          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 250.h,
            child: TranslationAnimatedWidget.tween(
              enabled: true,
              translationDisabled: const Offset(0, -140),
              translationEnabled: const Offset(0, 0),
              child: Container(
                width: Get.width.w - 52.w,
                height: 380.h,
                margin: EdgeInsets.only(top: 20.h),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(246, 248, 251, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 250.h,
            child: Container(
              width: Get.width.w - 52.w,
              height: 380.h,
              margin: EdgeInsets.only(top: 20.h),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 248, 251, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAnimatedWidget(
                      enabled: true,
                      delay: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      builder: (context, percent) {
                        return IntensitySlider(
                          slide: (percent * 100).obs,
                          onChange: (value) => controller.setOpacity = value,
                        );
                      },
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ColorsChooser(
                      colors: controller.colors,
                      onColorSelection: (index) => controller.setColor = index,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Scense(
                      gradientColors: controller.gradientColors,
                      sceneNames: controller.sceneNames,
                    )
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 258.h,
            right: 20.w,
            child: DelayedDisplay(
              slidingBeginOffset: const Offset(0, 0),
              child: ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.white, // Button color
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 32.w,
                        height: 30.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 7.h,
                          ),
                          child: SvgPicture.asset('assets/power_off.svg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
