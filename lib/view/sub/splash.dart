
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marlo_technologies/controller/provider/filter_provider.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Provider.of<FilterProvider>(context, listen: false)
      //     .fetchAllTransactions(context);
    Provider.of<FilterProvider>(context,listen: false).setUpTrasactionList();

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ),
          (route) => false);
    });
    return const Scaffold(
      body: Center(
        child: Text("This is Splash"),
      ),
    );
  }
}
