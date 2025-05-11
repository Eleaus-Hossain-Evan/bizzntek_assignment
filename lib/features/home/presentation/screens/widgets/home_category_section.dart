import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/core.dart';

class HomeCategorySection extends HookConsumerWidget {
  const HomeCategorySection({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = useState(categories.isNotEmpty ? categories.first : '');

    if (categories.isEmpty) {
      return const SizedBox.shrink(); // Or some placeholder
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: context.textTheme.bodyMedium?.copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
          8.verticalSpace,
          SizedBox(
            height: 50.h, // Adjust height as needed
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory.value == category;
                return ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      selectedCategory.value = category;
                    }
                  },
                  backgroundColor: isSelected ? AppColors.black : Colors.grey.shade200,
                  selectedColor: AppColors.black,
                  labelStyle: context.textTheme.bodyMedium?.copyWith(
                    color: isSelected ? AppColors.white : AppColors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: BorderSide.none,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  labelPadding: EdgeInsets.symmetric(vertical: 4.h),
                  iconTheme: IconThemeData(color: isSelected ? AppColors.black : AppColors.white),
                  checkmarkColor: AppColors.white,
                );
              },
              separatorBuilder: (context, index) => 14.horizontalSpace,
            ),
          ),
        ],
      ),
    );
  }
}
