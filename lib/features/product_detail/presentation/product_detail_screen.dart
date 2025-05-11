import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../common/presentation/cart_icon.dart';
import '../../common/widgets/app_text.dart';
import '../application/product_detail_provider.dart';

class ProductDetailScreen extends HookConsumerWidget {
  static const route = '/product-detail';
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    final isIntoCart = useState<bool>(false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          CartIcon(),
        ],
      ),
      body: Column(
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
          Padding(
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
                SizedBox(
                  width: 100.w,
                  height: 40,
                  child: MaterialButton(
                    onPressed: () {
                      isIntoCart.value = !isIntoCart.value;
                    },
                    color: isIntoCart.value ? Colors.transparent : context.color.primary,
                    textColor: isIntoCart.value ? context.color.primary : context.color.onPrimary,
                    textTheme: ButtonTextTheme.accent,
                    elevation: 0,
                    focusElevation: 0,
                    hoverElevation: 0,
                    highlightElevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: context.color.primary,
                      ),
                    ),
                    child: Text('Add to Cart'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: isIntoCart.value
          ? BottomAppBar(
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.exposure_minus_1)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.plus_one)),
                  ],
                ),
              ),
            )
          : null,
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
