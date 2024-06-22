import 'package:flutter/material.dart';

class WidgetLoadingView extends StatelessWidget {
  const WidgetLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
