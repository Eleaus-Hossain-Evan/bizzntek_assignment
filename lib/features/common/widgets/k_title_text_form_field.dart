import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import 'app_text.dart';
import 'k_text_form_field.dart';

class KTitleTextFormField extends StatelessWidget {
  const KTitleTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: mainMin,
      children: [
        AppText(
          title,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 11.sp,
        ),
        4.verticalSpace,
        KTextFormField(
          controller: controller,
          hintText: title,
          validator: validator,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

class KTitleTextFormField2 extends StatelessWidget {
  const KTitleTextFormField2({
    super.key,
    required this.controller,
    this.validator,
    required this.title,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.textInputAction = TextInputAction.next,
    this.hintTextStyle,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  final String? hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction textInputAction;
  final TextStyle? hintTextStyle;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: mainMin,
      children: [
        AppText(
          title,
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        8.verticalSpace,
        KTextFormField2(
          controller: controller,
          hintText: hintText ?? title,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          hintTextStyle: hintTextStyle,
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }
}

class KTitleDateFormField extends StatelessWidget {
  const KTitleDateFormField({
    super.key,
    required this.controller,
    this.validator,
    required this.title,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: mainMin,
      children: [
        AppText(title, color: AppColors.primary),
        4.verticalSpace,
        KTextFormField.date(
          datePattern: 'MM/dd/yyyy',
          controller: controller,
          hintText: title,
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class KTitleDateFormField2 extends StatelessWidget {
  const KTitleDateFormField2(
      {super.key,
      required this.controller,
      this.validator,
      required this.title,
      this.onChanged,
      this.hintTextStyle,
      this.hintText,
      this.prefixIcon,
      this.readOnly = false});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  final Function(String)? onChanged;
  final TextStyle? hintTextStyle;
  final String? hintText;
  final Widget? prefixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: mainMin,
      children: [
        AppText(title, color: AppColors.primary),
        8.verticalSpace,
        KTextFormField2.date(
          datePattern: 'MM/dd/yyyy',
          controller: controller,
          hintText: hintText ?? title,
          validator: validator,
          onChanged: onChanged,
          hintTextStyle: hintTextStyle,
          prefixIcon: prefixIcon,
          readOnly: readOnly,
        ),
      ],
    );
  }
}
