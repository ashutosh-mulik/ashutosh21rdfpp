import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Scense extends StatelessWidget {
  final List gradientColors;
  final List sceneNames;
  const Scense({Key? key, required this.gradientColors, required this.sceneNames}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Scense',
          style: TextStyle(
            fontSize: 16.sp,
            color: const Color.fromRGBO(10, 77, 162, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 25.0,
          mainAxisSpacing: 25.0,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10.h),
          childAspectRatio: 2.5,
          children: List.generate(
            4,
            (index) {
              /// add animation only to second column
              return index % 2 != 0
                  ? TranslationAnimatedWidget.tween(
                      delay: const Duration(milliseconds: 800),
                      enabled: true,
                      translationDisabled: const Offset(-60, 0),
                      translationEnabled: const Offset(0, 0),
                      child: _singleCard(index),
                    )
                  : _singleCard(index);
            },
          ),
        )
      ],
    );
  }

  _singleCard(index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
        gradient: LinearGradient(
          colors: gradientColors[index],
          begin: const Alignment(-1.0, 1),
          end: const Alignment(1.0, -1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/surface.svg'),
          Text(
            sceneNames[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
