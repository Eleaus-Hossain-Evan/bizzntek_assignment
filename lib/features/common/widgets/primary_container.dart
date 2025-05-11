import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class PrimaryContainer extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
  });
  final String title;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
      child: Row(
        crossAxisAlignment: crossStart,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                AppText(
                  title,
                  style: ContentTextStyle.headline4.colorWhite(),
                ),
                AppText(
                  subtitle,
                  style: ContentTextStyle.bodyText1.colorWhite(),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 10);
}
