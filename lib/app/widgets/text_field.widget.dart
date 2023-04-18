import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontari_mobile/app/util/theme/app_color.dart';
import 'package:ontari_mobile/app/util/theme/app_size.dart';
import 'package:ontari_mobile/app/util/theme/app_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.hintText = '',
    this.onChange,
    this.onTapPrefixIcon,
    this.onFieldSubmitted,
    this.onSaved,
    this.prefixIcon,
    required this.controller,
    this.label = '',
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.onTapSuffixIcon,
  });
  final String hintText;
  final String label;
  final TextEditingController controller;
  final String? prefixIcon;
  final String? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChange;
  final void Function()? onTapPrefixIcon;
  final VoidCallback? onTapSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.bodyTextMedium(context).copyWith(
              fontWeight: FontWeight.w600,
              height: 19.12 / 14,
              leadingDistribution: TextLeadingDistribution.even,),
        ),
        SizedBox(
          height: AppSize.kSpacing10.h,
        ),
        SizedBox(
          height: 52.h,
          child: TextFormField(
            decoration: _textFieldInputdecoration(context),
            cursorColor: AppColors.kSecondaryLight,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            style: AppStyles.bodyTextMedium(context).copyWith(
              fontFamily: GoogleFonts.manrope().fontFamily,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 19.12 / 14,
              color:
                  Get.isDarkMode ? AppColors.kWhite : AppColors.kPrimaryLight,
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _textFieldInputdecoration(BuildContext context) {
    return InputDecoration(
      prefixIcon: prefixIcon != null
          ? GestureDetector(
              onTap: onTapPrefixIcon ?? () {},
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 25.w,
                height: 25.w,
                margin: EdgeInsets.fromLTRB(18.w, 17.h, 16.w, 17.h),
                child: SvgPicture.asset(
                  prefixIcon!,
                ),
              ),
            )
          : null,
      prefixIconConstraints: const BoxConstraints(),
      suffixIconConstraints: const BoxConstraints(),
      suffixIcon: suffixIcon != null
          ? GestureDetector(
              onTap: onTapSuffixIcon ?? () {},
              child: Container(
                width: 25.w,
                height: 25.w,
                margin: EdgeInsets.fromLTRB(0, 17.h, 16.w, 17.h),
                child: SvgPicture.asset(
                  suffixIcon!,
                ),
              ),
            )
          : null,
      hintText: hintText,
      constraints: const BoxConstraints(),
      contentPadding: EdgeInsets.zero,
      hintStyle: AppStyles.bodyTextMedium(context).copyWith(
        fontFamily: GoogleFonts.manrope().fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 19.12 / 14,
        color: AppColors.kGrey,
      ),
      border: _buildBorder(),
      enabledBorder: _buildEnabledBorder(),
      focusedBorder: _buildFocusedBorder(),
    );
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.kSecondaryLight,
        width: 1.r,
      ),
      borderRadius: BorderRadius.circular(
        AppSize.kRadius10.r,
      ),
    );
  }

  OutlineInputBorder _buildEnabledBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.kBorderColor,
        width: 1.r,
      ),
      borderRadius: BorderRadius.circular(
        AppSize.kRadius10.r,
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.kBorderColor,
        width: 1.r,
      ),
      borderRadius: BorderRadius.circular(
        AppSize.kRadius10.r,
      ),
    );
  }
}
