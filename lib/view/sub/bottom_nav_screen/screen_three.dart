import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screenthree extends StatelessWidget {
  const Screenthree({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: CupertinoSearchTextField(
          prefixIcon: SizedBox(),
          placeholder: 'Search vessel',
          suffixMode: OverlayVisibilityMode.always,
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
