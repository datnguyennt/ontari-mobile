import 'package:flutter/material.dart';
import '../common/theme/theme.export.dart';

import 'elevated_container.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ElevatedContainer(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(
          color: AppColors.kprimary,
        ),
      ),
    );
  }
}
