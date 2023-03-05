import 'package:flutter/material.dart';
import 'package:flutter_clean_architech_bloc/app/util/theme/app_color.dart';
import 'package:flutter_clean_architech_bloc/app/util/theme/app_size.dart';
import 'package:flutter_clean_architech_bloc/app/util/theme/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GetBuilder(builder: (OnboardingController controller) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPageSlide(controller),
          _buildDotIndicator(controller, context),
        ],
      );
    });
  }

  Expanded _buildPageSlide(OnboardingController controller) {
    return Expanded(
      child: PageView.builder(
        itemCount: controller.onboardings.length,
        clipBehavior: Clip.none,
        onPageChanged: controller.onPageChanged,
        controller: controller.pageController,
        itemBuilder: (context, index) {
          OnboardingText onboardingText = controller.onboardings[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                onboardingText.image,
                width: Get.width,
                height: 398.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: AppSize.kSpacing48.h,
              ),
              Text(
                onboardingText.title,
                style: TextStyles.headline1(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.kSpacing50.w,
                  vertical: AppSize.kSpacing20.h,
                ),
                child: Text(
                  onboardingText.description,
                  style: TextStyles.bodyTextMedium(context).copyWith(
                    color: AppColors.kGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDotIndicator(
      OnboardingController controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSize.kSpacing32.w,
        0,
        AppSize.kSpacing32,
        AppSize.kSpacing58.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: List.generate(
              controller.onboardings.length,
              (index) => Container(
                width: AppSize.kSpacing10.w,
                height: AppSize.kSpacing10.w,
                margin: EdgeInsets.only(
                  right: AppSize.kSpacing8.w,
                ),
                decoration: BoxDecoration(
                  color: index == controller.currentIndex
                      ? AppColors.kPrimaryLight
                      : AppColors.kDotUnselected,
                  shape: BoxShape.circle,
                ),
              ),
            ).toList(),
          ),
          MaterialButton(
            height: AppSize.kSpacing52.h,
            minWidth: AppSize.kSpacing140.w,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppSize.kRadius12.r,
              ),
            ),
            color: AppColors.kPrimaryLight,
            onPressed: controller.nextPage,
            child: Text(
              "Next",
              style: TextStyles.bodyTextMedium(context).copyWith(
                color: AppColors.kWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
