import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HorizontalButtons extends StatelessWidget {
  final Function onClick;
  final int activeIndex;
  final List lightIcons;
  final List darkIcons;
  final List buttonNames;
  const HorizontalButtons({
    Key? key,
    required this.onClick,
    required this.activeIndex,
    required this.darkIcons,
    required this.lightIcons,
    required this.buttonNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 45.h,
          width: 338.w,
          child: ListView.separated(
            physics: const ScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 0.h,
                width: 12.w,
              );
            },
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 140.w,
                decoration: BoxDecoration(
                  color: activeIndex == index ? const Color.fromRGBO(9, 59, 123, 1) : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(14.r),
                  ),
                ),
                child: GestureDetector(
                  onTap: () => onClick(index),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      activeIndex == index ? SvgPicture.asset(lightIcons[index]) : SvgPicture.asset(darkIcons[index]),
                      Text(
                        buttonNames[index],
                        style: TextStyle(
                          color: activeIndex == index ? Colors.white : const Color.fromRGBO(9, 59, 123, 1),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
