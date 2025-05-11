import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import 'app_text.dart';

class QuestionOptionTile extends StatelessWidget {
  const QuestionOptionTile({
    super.key,
    required this.value,
    required this.option,
    this.onChanged,
  });

  final bool value;
  final String option;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(!value),
      borderRadius: BorderRadius.circular(6.r),
      child: AnimatedContainer(
        duration: Durations.short4,
        height: 44.h,
        decoration: BoxDecoration(
          color: value ? AppColors.primary : const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          crossAxisAlignment: crossCenter,
          children: [
            16.horizontalSpace,
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: value ? AppColors.white : Colors.transparent,
                shape: BoxShape.circle,
                border: value
                    ? null
                    : Border.all(
                        color: const Color(0xff666666),
                      ),
              ),
              child: value
                  ? const Icon(
                      Icons.check,
                      size: 12,
                      color: AppColors.primary,
                    )
                  : null,
            ),
            14.horizontalSpace,
            Flexible(
              child: AppText(
                option,
                fontSize: 14.sp,
                color: value ? AppColors.white : const Color(0xff666666),
              ),
            )
          ],
        ),
      ),
    );
  }
}
