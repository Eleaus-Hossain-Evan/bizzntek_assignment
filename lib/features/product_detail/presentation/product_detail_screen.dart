import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../cart/application/cart_provider.dart';
import '../../common/presentation/cart_icon.dart';
import '../../common/widgets/app_text.dart';
import '../application/product_detail_provider.dart';

class ProductDetailScreen extends HookConsumerWidget {
  static const route = '/product-detail';
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          CartIcon(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: CachedNetworkImage(
                imageUrl: product.image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.scaleDown,
              ),
            ),
            TitleAndDescriptionSection(),
            8.verticalSpace,
            RatingAndCategorySection(),
            12.verticalSpace,
            PriceAndCartSection(),
          ],
        ),
      ),
    );
  }
}

class PriceAndCartSection extends HookConsumerWidget {
  const PriceAndCartSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    final cartCount = ref.watch(currentProductCartCountProvider);
    final isIntoCart = (cartCount > 0);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        children: [
          AppText(
            'Price: ',
            style: context.textTheme.titleMedium?.setFontWeight(FontWeight.bold),
          ),
          AppText(
            '${product.price} \$',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          Spacer(),
          if (isIntoCart)
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(cartProvider.notifier).removeProduct(product);
                  },
                  icon: Icon(Icons.remove),
                ),
                AppText('$cartCount'),
                IconButton(
                  onPressed: () {
                    ref.read(cartProvider.notifier).addProduct(product);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          else
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: context.color.primary,
                ),
              ),
              onPressed: () {
                ref.read(cartProvider.notifier).addProduct(product);
              },
              child: Text('Add to Cart'),
            )
        ],
      ),
    );
  }
}

class TitleAndDescriptionSection extends HookConsumerWidget {
  const TitleAndDescriptionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.color.primaryContainer.lighten(4),
          ),
          child: AppText(
            product.title,
            style: context.textTheme.titleMedium?.setFontWeight(FontWeight.bold),
          ),
        ),
        8.verticalSpace,
        // Discription
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: AppText(
            'Discription:',
            style: context.textTheme.titleSmall?.setFontWeight(FontWeight.bold),
          ),
        ),
        2.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: AppText(product.description),
        ),
      ],
    );
  }
}

class RatingAndCategorySection extends HookConsumerWidget {
  const RatingAndCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          children: [
            AppText(
              'Rating: ${product.rating.rate}',
              style: context.textTheme.titleSmall?.setFontWeight(FontWeight.bold),
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            AppText(
              '(${product.rating.count})',
              style: context.textTheme.titleSmall?.setFontWeight(FontWeight.bold),
            ),
            Spacer(),
            AppText(
              'Category: ',
              style: context.textTheme.titleSmall?.setFontWeight(FontWeight.bold),
            ),
            AppText(product.category),
          ],
        ));
  }
}
