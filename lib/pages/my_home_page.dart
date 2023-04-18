import 'package:flutter/material.dart';
import 'package:ontari_mobile/flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppFlavor.title),
      ),
      body: Center(
        child: Text(
          'Hello ${AppFlavor.title}',
        ),
      ),
    );
  }
}
