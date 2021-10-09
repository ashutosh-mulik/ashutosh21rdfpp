import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColorsChooser extends StatelessWidget {
  final List colors;
  const ColorsChooser({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Colors',
          style: TextStyle(
            fontSize: 16.sp,
            color: const Color.fromRGBO(10, 77, 162, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        SizedBox(
          height: 25.h,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 0.h,
                width: 7.w,
              );
            },
            itemCount: 7,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CircleAvatar(
                backgroundColor: colors[index],
                child: index == colors.length - 1 ? SvgPicture.asset('assets/add.svg') : Container(),
              );
            },
          ),
        )
      ],
    );
  }
}
