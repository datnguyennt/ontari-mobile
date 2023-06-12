import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/common/extension/context.extension.dart';
import 'package:ontari_mobile/core/common/size_config.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';
import 'package:ontari_mobile/core/widget/rounded_button.widget.dart';
import 'package:ontari_mobile/generated/assets.gen.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String description;
  const HeaderWidget({
    super.key,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = SizeConfig.screenWidth;
    return SizedBox(
      height: 178.h,
      width: screenWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 178.h,
            width: screenWidth,
            decoration: BoxDecoration(
              color: context.isDarkMode
                  ? AppColors.kDarkBlack
                  : AppColors.kLightBlue,
            ),
          ),
          Positioned(
            left: (-screenWidth / 3).w,
            top: (-screenWidth / 2).h,
            child: Container(
              height: 400.w,
              width: 400.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.kWhite.withOpacity(0.4),
                  width: 140.w,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.kHorizonSpace.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppStyles.headline2(context).copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: context.isDarkMode
                              ? AppColors.kWhite
                              : AppColors.kGreyscale.shade700,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          description,
                          style: AppStyles.bodyTextMedium(context).copyWith(
                            color: AppColors.kGreyscale.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 40.w,
                height: 40.w,
                margin: EdgeInsets.only(
                  right: AppSize.kHorizonSpace.w,
                ),
                child: RoundedButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSize.kRadius10.r,
                    ),
                  ),
                  backgroundColor: AppColors.kWhite,
                  child: Assets.icons.icClose.svg(
                    height: 15.w,
                    width: 15.w,
                    color: AppColors.kPrimaryLight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
