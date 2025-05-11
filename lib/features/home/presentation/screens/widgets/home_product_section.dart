import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/core.dart';
import '../../../../product_detail/presentation/product_detail_screen.dart';
import '../../../application/home_products_controller.dart';

class HomeProductSection extends HookConsumerWidget {
  const HomeProductSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(homeProductsProvider);
    return productsAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return const Center(child: Text('No products found.'));
        }
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          itemCount: products.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.7, // Adjust as needed for item height
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return InkWell(
              onTap: () {
                // Navigate to product detail screen
                context.pushNamed(
                  ProductDetailScreen.route,
                  extra: product,
                );
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                clipBehavior: Clip.antiAlias, // Ensures content respects border radius
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3, // Give more space to the image
                      child: Container(
                        width: double.infinity,
                        color: Colors.grey.shade100, // Placeholder background for image area
                        child: product.image.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: product.image,
                                fit: BoxFit.scaleDown,
                              )
                            : Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                      ),
                    ),
                    Expanded(
                      flex: 2, // Give space for text content
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // Pushes price to bottom
                          children: [
                            Text(
                              product.title,
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
    );
  }
}
