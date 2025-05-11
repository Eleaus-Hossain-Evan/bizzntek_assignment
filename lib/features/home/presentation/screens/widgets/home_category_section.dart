import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/core.dart';
import '../../../application/home_categories_controller.dart';

class HomeCategorySection extends HookConsumerWidget {
  const HomeCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsyncValue = ref.watch(homeCategoriesProvider);

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
            child: categoriesAsyncValue.when(
              skipLoadingOnRefresh: false,
              data: (categories) {
                final selectedCategory = useState(categories.isNotEmpty ? categories.first : '');

                return ListView.separated(
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
                      iconTheme:
                          IconThemeData(color: isSelected ? AppColors.black : AppColors.white),
                      checkmarkColor: AppColors.white,
                    );
                  },
                  separatorBuilder: (context, index) => 14.horizontalSpace,
                );
              },
              loading: () => Skeletonizer(
                enabled: true,
                child: Row(
                  spacing: 14.w,
                  children: List.generate(
                    3,
                    (index) => Bone(
                      width: 100,
                      height: 60,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ), // Or a shimmer effect
              error: (error, stack) => Center(child: Text('Could not load categories: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
