import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marlo_technologies/controller/provider/calender_provider.dart';
import 'package:marlo_technologies/controller/provider/filter_provider.dart';

import 'package:marlo_technologies/view/sub/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      builder: (context, child) => MultiProvider(
        providers: [
          ListenableProvider(
            create: (context) => FilterProvider(),
          ),
          ListenableProvider(
            create: (context) => CalenderProvider(),
          ),
          // ListenableProvider(
          //   create: (context) => TransactionProvider(),
          // )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'Marlo Technologies',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MySplashScreen(),
        ),
      ),
    );
  }
}
