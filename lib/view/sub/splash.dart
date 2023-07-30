import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marlo_technologies/controller/all_services.dart';
import 'package:marlo_technologies/controller/provider/all_transaction_provider.dart';
import 'package:marlo_technologies/view/sub/bottom_nav_controller.dart';
import 'package:provider/provider.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TransactionProvider>(context, listen: false)
          .fetchAllTransactions();

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNav(),), (route) => false);
    });
    return const Scaffold(
      body: Center(
        child: Text("This is Splash"),
      ),
    );
  }
}
