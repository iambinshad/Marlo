import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marlo_technologies/controller/provider/calender_provider.dart';
import 'package:marlo_technologies/controller/provider/filter_provider.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_controller.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/home/home.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_screen/screen_two.dart';
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
          ListenableProvider(create:  (context) => CalenderProvider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/bottomNav',
          routes: {
            '/homeScreen': (context) => HomeScreen(),
            "/allTransactinos": (context) => const ViewAllTransactions(),
            '/bottomNav': (context) => const BottomNav(),
          },
          title: 'Marlo Technologies',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const BottomNav(),
        ),
      ),
    );
  }
}
