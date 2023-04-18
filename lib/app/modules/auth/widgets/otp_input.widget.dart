import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontari_mobile/app/util/theme/theme.export.dart';

class OTPInputWidget extends StatelessWidget {
  const OTPInputWidget({
    super.key,
    required this.textControllers,
  });
  final List<TextEditingController> textControllers;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          6,
          (index) => _buildDitgitInput(context, index),
        ).toList(),
      ),
    );
  }

  SizedBox _buildDitgitInput(BuildContext context, int index) {
    return SizedBox(
      width: 48.w,
      height: 48.w,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: textControllers[index],
        style: AppStyles.bodyTextMedium(context).copyWith(
          fontFamily: GoogleFonts.manrope().fontFamily,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Get.isDarkMode ? AppColors.kWhite : AppColors.kPrimaryLight,
        ),
        onChanged: (value) {
          if (value.length == 1 && index <= 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          } else if (value.isNotEmpty && index == textControllers.length - 1) {
            FocusScope.of(context).unfocus();
          }
        },
        decoration: _textFieldInputdecoration(context),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        scrollPadding: EdgeInsets.zero,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }

  InputDecoration _textFieldInputdecoration(BuildContext context) {
    return InputDecoration(
      prefixIconConstraints: const BoxConstraints(),
      suffixIconConstraints: const BoxConstraints(),
      hintStyle: AppStyles.bodyTextMedium(context).copyWith(
        fontFamily: GoogleFonts.manrope().fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 19.12 / 14,
        color: AppColors.kGrey,
      ),
      constraints: const BoxConstraints(),
      contentPadding: EdgeInsets.zero,
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
