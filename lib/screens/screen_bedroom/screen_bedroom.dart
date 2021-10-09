import 'package:ashutosh21rdfpp/controllers/screen_bedroom/bedroom_screen_controller.dart';
import 'package:ashutosh21rdfpp/widgets/colors_picker.dart';
import 'package:ashutosh21rdfpp/widgets/intensity_slider.dart';
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
            height: 400.h,
            child: Transform.rotate(
              angle: 22.6.r,
              child: SvgPicture.asset('assets/circles.svg'),
            ),
          ),

          Positioned(
            right: 30.w,
            top: -55.h,
            child: SvgPicture.asset('assets/lamp.svg'),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 55.w),
                    child: Text(
                      '4 Lights',
                      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                  ),
                ],
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
                    IntensitySlider(
                      onChange: (value) {},
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ColorsChooser(
                      colors: controller.colors,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
