import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class IntensitySlider extends StatelessWidget {
  final RxDouble slide = 0.0.obs;
  final Function onChange;
  IntensitySlider({Key? key, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Intensity',
          style: TextStyle(
            fontSize: 16.sp,
            color: const Color.fromRGBO(10, 77, 162, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/bulb_off.svg'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Obx(
                  () {
                    return SfSliderTheme(
                      data: SfSliderThemeData(
                        thumbColor: Colors.white,
                        activeDividerColor: Colors.amber,
                        activeTrackColor: Colors.amber,
                        inactiveTrackColor: Colors.grey.withOpacity(0.2),
                        activeTrackHeight: 2,
                        inactiveTrackHeight: 2,
                        tickOffset: const Offset(0.0, 10.0),
                        tickSize: const Size(1, 3),
                        overlayRadius: 0,
                        thumbRadius: 8,
                      ),
                      child: SfSlider(
                        value: slide.value,
                        min: 0,
                        max: 100,
                        showTicks: true,
                        interval: 20,
                        onChanged: (value) {
                          slide.value = value;
                          onChange(value);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            SvgPicture.asset('assets/bulb_on.svg'),
          ],
        ),
      ],
    );
  }
}
