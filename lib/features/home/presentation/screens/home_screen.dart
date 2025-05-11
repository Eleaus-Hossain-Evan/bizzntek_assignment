import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../application/home_categories_controller.dart';
import '../../application/home_products_controller.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_category_section.dart';
import 'widgets/home_product_section.dart';

class HomeScreen extends HookConsumerWidget {
  static const route = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(homeProductsProvider);
    final refreshController = useMemoized(RefreshController.new);

    return Scaffold(
      appBar: HomeAppBar(),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: () async {
          await Future.wait([
            ref.refresh(homeProductsProvider.future),
            ref.refresh(homeCategoriesProvider.future),
          ]);
          refreshController.refreshCompleted();
        },
        child: Column(
          children: [
            SizedBox(
              height: 120.h,
              child: HomeCategorySection(),
            ),
            Expanded(
              child: productsAsyncValue.when(
                data: (products) {
                  return HomeProductSection(
                    products: products,
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error loading products: $error'),
                      SizedBox(height: 8.h),
                      ElevatedButton(
                        onPressed: () => ref.invalidate(homeProductsProvider),
                        child: const Text('Retry'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
