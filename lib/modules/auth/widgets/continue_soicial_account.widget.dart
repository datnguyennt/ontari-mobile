import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';
import 'package:ontari_mobile/di/di.dart';
import 'package:ontari_mobile/generated/locale_keys.g.dart';
import 'package:ontari_mobile/modules/core/blocs/app_bloc/app_bloc.dart';

class ContinueSocialAccountWidget extends StatelessWidget {
  const ContinueSocialAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.kSpacing24,
      ),
      child: Text(
        LocaleKeys.text_continue_social_account.tr(),
        style: AppStyles.headline2(context).copyWith(
          fontWeight: FontWeight.w400,
          color: getIt<AppBloc>().isDarkMode
              ? AppColors.kWhite
              : AppColors.kGreyscale.shade500,
        ),
      ),
    );
  }
}
