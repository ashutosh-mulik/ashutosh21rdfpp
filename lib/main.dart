import 'package:ashutosh21rdfpp/screens/screen_bedroom/screen_bedroom.dart';
import 'package:ashutosh21rdfpp/screens/screen_one/screen_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Routes());
}

/// Entry point
class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [ScreenUtil] to make UI look same on different screen sizes.
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        title: 'ASHUTOSH21RDFPP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, widget) {
          return MediaQuery(
            /// Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget as Widget,
          );
        },
        initialRoute: '/one',
        getPages: [
          GetPage(name: '/one', page: () => ScreenOne(), transition: Transition.fadeIn),
          GetPage(name: '/bedroom', page: () => BedroomScreen(), transition: Transition.fadeIn),
        ],
      ),
    );
  }
}
