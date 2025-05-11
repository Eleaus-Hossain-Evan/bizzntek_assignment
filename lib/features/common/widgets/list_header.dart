import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import 'widgets.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({
    super.key,
    required this.title,
    this.padding,
  });
  final String title;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 26.w),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          AppText(
            title,
            style: context.textTheme.bodyLarge?.bold.colorPrimary(),
          ),
          10.verticalSpace,
          Divider(
            height: 0,
            thickness: 1,
            color: context.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
