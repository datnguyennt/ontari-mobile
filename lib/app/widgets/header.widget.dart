import 'package:flutter/material.dart';
import 'package:ontari_mobile/app/util/theme/theme.export.dart';
import 'package:ontari_mobile/app/widgets/rounded_button.widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.description,
    required this.title,
    this.height = 178,
  });
  final double height;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: Get.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 178.h,
            width: Get.width,
            decoration: const BoxDecoration(
              color: AppColors.kLightBlue,
            ),
          ),
          Positioned(
            left: (-Get.width / 3).w,
            top: (-Get.width / 2).h,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
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
                        strutStyle: StrutStyle(
                          fontStyle: FontStyle.normal,
                          height: 38 / 22,
                          leadingDistribution: TextLeadingDistribution.even,
                          fontSize: 22.sp,
                        ),
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                              color: Get.isDarkMode
                                  ? AppColors.kWhite
                                  : AppColors.kPrimaryLight,
                              fontStyle: FontStyle.normal,
                              height: 38 / 22,
                              leadingDistribution: TextLeadingDistribution.even,
                            ),
                      ),
                      Flexible(
                        child: Text(
                          description,
                          strutStyle: StrutStyle(
                            fontStyle: FontStyle.normal,
                            height: 22 / 14,
                            leadingDistribution: TextLeadingDistribution.even,
                            fontSize: 14.sp,
                          ),
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: Get.isDarkMode
                                        ? AppColors.kWhite
                                        : AppColors.kGreyscale.shade500,
                                    fontStyle: FontStyle.normal,
                                    height: 22 / 14,
                                    fontSize: 14.sp,
                                    leadingDistribution:
                                        TextLeadingDistribution.even,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(
                    right: AppSize.kHorizonSpace.w,
                  ),
                  child: RoundedButton(
                    onPressed: () {
                      Get.back();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.kRadius10.r,
                      ),
                    ),
                    buttonColor: AppColors.kWhite,
                    child: SvgPicture.asset(
                      AppAssets.icClose,
                      color: AppColors.kPrimaryLight,
                      height: 15.w,
                      width: 15.w,
                      fit: BoxFit.cover,
                    ),
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
