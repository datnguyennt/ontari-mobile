import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';
import 'package:ontari_mobile/di/di.dart';
import 'package:ontari_mobile/modules/core/blocs/theme_bloc/theme_bloc.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isRequired;
  final bool isShowLabel;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onTapPrefixIcon;
  final VoidCallback? onTapSuffixIcon;
  final int? maxLine;
  final int? maxLength;
  final FormFieldValidator? validator;
  final TextInputAction? textInputAction;
  final String? errorText;
  final double? height;
  final EdgeInsets? prefixPadding;
  final EdgeInsets? suffixPadding;
  final OutlineInputBorder? outlineInputBorder;
  final TextStyle? lableStyle;
  final TextStyle? textInputStyle;
  final bool enabled;

  const TextFieldWidget({
    super.key,
    this.hintText = '',
    this.onChanged,
    this.onTapPrefixIcon,
    this.onSaved,
    this.prefixIcon,
    required this.controller,
    this.label = '',
    this.onFieldSubmitted,
    this.keyboardType,
    this.obscureText = false,
    this.isRequired = false,
    this.isShowLabel = true,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.maxLine,
    this.maxLength,
    this.validator,
    this.textInputAction,
    this.errorText,
    this.height,
    this.prefixPadding,
    this.suffixPadding,
    this.outlineInputBorder,
    this.lableStyle,
    this.textInputStyle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeBloc = getIt<ThemeBloc>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.bodyTextMedium(context).copyWith(
            fontWeight: FontWeight.w600,
            height: 19.12 / 14,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
        SizedBox(
          height: AppSize.kSpacing10.h,
        ),
        SizedBox(
          height: 52.h,
          child: TextFormField(
            maxLength: maxLength,
            maxLines: maxLine ?? 1,
            enabled: enabled,
            decoration: _textFieldInputdecoration(context),
            validator: validator ?? (_) => errorText,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            textInputAction: textInputAction,
            onChanged: onChanged,
            cursorColor: AppColors.kSecondaryLight,
            style: textInputStyle ??
                AppStyles.bodyTextMedium(context).copyWith(
                  fontFamily: GoogleFonts.manrope().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  height: 19.12 / 14,
                  color: themeBloc.isDarkMode
                      ? AppColors.kWhite
                      : AppColors.kPrimaryLight,
                ),
          ),
        ),
        if ((errorText ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: AppSize.kSpacing10),
            child: Text(
              errorText ?? '',
              style: AppStyles.bodyTextMedium(context).copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 16 / 12,
                color: AppColors.kRed,
                leadingDistribution: TextLeadingDistribution.even,
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
              child: Padding(
                padding: prefixPadding ??
                    EdgeInsets.symmetric(
                      horizontal: AppSize.kSpacing12.w,
                    ),
                child: prefixIcon,
              ),
            )
          : null,
      isDense: true,
      counterText: '',
      suffixIcon: suffixIcon != null
          ? GestureDetector(
              onTap: onTapSuffixIcon ?? () {},
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: suffixPadding ??
                    EdgeInsets.symmetric(horizontal: AppSize.kSpacing12.w),
                child: suffixIcon,
              ),
            )
          : null,
      hintText: hintText,
      constraints: const BoxConstraints(),
      hintStyle: AppStyles.bodyTextMedium(context).copyWith(
        color: AppColors.kBorderColor,
      ),
      border: _buildBorder(),
      enabledBorder: _buildBorder(),
      focusedBorder: _buildFocusedBorder(),
      errorBorder: _buildErrorBorder(),
      disabledBorder: _buildBorder(),
      filled: true,
      fillColor: AppColors.kWhite,
    );
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: (errorText ?? '').isEmpty
            ? AppColors.kSecondaryLight
            : AppColors.kRed,
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
        color:
            (errorText ?? '').isEmpty ? AppColors.kBorderColor : AppColors.kRed,
        width: 1.r,
      ),
      borderRadius: BorderRadius.circular(
        AppSize.kRadius10.r,
      ),
    );
  }

  OutlineInputBorder _buildErrorBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.kRed,
        width: 1.r,
      ),
      borderRadius: BorderRadius.circular(
        AppSize.kRadius10.r,
      ),
    );
  }
}
