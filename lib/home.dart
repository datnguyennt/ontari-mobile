import 'package:flutter/material.dart';
import 'package:flutter_clean_architech_bloc/constants/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

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
          Assets.icons.icCalendar.svg()
        ],
      ),
    );
  }
}
