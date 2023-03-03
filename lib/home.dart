import 'package:flutter/material.dart';
import 'package:flutter_clean_architech_bloc/constants/assets.gen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(
              "Hello",
            ),
          ),
          Assets.images.onboarding1.image(width: 150, height: 150)
        ],
      ),
    );
  }
}
