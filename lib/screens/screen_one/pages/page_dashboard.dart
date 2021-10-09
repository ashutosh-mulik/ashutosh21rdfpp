import 'package:ashutosh21rdfpp/controllers/screen_one/pages/dashboard_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.put(DashboardPageController());
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
          top: 80.h,
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Control\nPanel',
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SvgPicture.asset('assets/user.svg')
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: Get.width.w - 53.w,
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
                          Text(
                            'All Rooms',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color.fromRGBO(10, 77, 162, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            shrinkWrap: true,
                            childAspectRatio: (20 / 17.6),
                            children: List.generate(
                              6,
                              (index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),

                                  /// For demo perpose
                                  /// Every card opens same [BedroomScreen]

                                  child: GestureDetector(
                                    onTap: () => Get.toNamed('/bedroom'),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.r),
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(10, 77, 162, 0.1),
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(controller.images[index]),
                                            const Spacer(),
                                            Text(
                                              controller.names[index],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              controller.lights[index],
                                              style: TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
