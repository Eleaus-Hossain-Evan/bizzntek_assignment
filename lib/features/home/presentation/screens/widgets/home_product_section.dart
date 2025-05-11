import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import '../../../../common/widgets/k_cached_network_image.dart';
import '../../../domain/entity/product_entity.dart';

class HomeProductSection extends StatelessWidget {
  const HomeProductSection({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text('No products found.'));
    }
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.7, // Adjust as needed for item height
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return InkWell(
          onTap: () {},
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
                        ? KCachedNetworkImageWdLoading(
                            imageUrl: product.image,
                            fit: BoxFit.cover,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes price to bottom
                      children: [
                        Text(
                          product.title,
                          style:
                              context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
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
  }
}
