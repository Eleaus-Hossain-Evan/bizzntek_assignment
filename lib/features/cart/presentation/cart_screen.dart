import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../common/widgets/widgets.dart';
import '../application/cart_provider.dart';

class CartScreen extends HookConsumerWidget {
  static const route = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cart.isEmpty
          ? Center(
              child: AppText(
                'Cart is empty',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16.w),
                    itemCount: cart.length,
                    separatorBuilder: (context, index) => 16.verticalSpace,
                    itemBuilder: (context, index) {
                      final cartItem = cart[index];
                      return ProviderScope(
                        overrides: [currentCartProvider.overrideWithValue(cartItem)],
                        child: CartItemCard(),
                      );
                    },
                  ),
                )
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        color: context.color.surfaceContainer,
        height: 120.h,
        child: Column(
          spacing: 10.h,
          children: [
            Row(
              spacing: 12.w,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  'TOTAL:',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                AppText(
                  '${ref.watch(totalCartPriceProvider).toStringAsFixed(2)}\$',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                ref.read(cartProvider.notifier).clear();
                context.pop();
              },
              label: AppText(
                'Checkout',
                fontWeight: FontWeight.bold,
              ),
              icon: CircleAvatar(
                radius: 14,
                child: AppText('${ref.watch(totalCartCountProvider)}'),
              ),
              iconAlignment: IconAlignment.end,
              style: FilledButton.styleFrom(
                backgroundColor: context.color.secondaryFixedDim,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends HookConsumerWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItem = ref.watch(currentCartProvider);
    return Card(
      child: Row(
        spacing: 8.w,
        children: [
          CachedNetworkImage(
            imageUrl: cartItem.product.image,
            width: 80,
            height: 80,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "Name: ${cartItem.product.title}",
                  fontSize: 14.sp,
                  maxLines: 1,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.gray(
                            cartItem.product.category,
                            maxLines: 1,
                            fontSize: 11.sp,
                            overflow: TextOverflow.ellipsis,
                          ),
                          AppText(
                            '${cartItem.product.price} \$',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ],
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        ref.read(cartProvider.notifier).removeProduct(cartItem.product);
                      },
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      icon: Icon(Icons.remove),
                    ),
                    SizedBox(
                      width: 20.w,
                      child: AppText(
                        '${cartItem.quantity}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        ref.read(cartProvider.notifier).addProduct(cartItem.product);
                      },
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
          4.horizontalSpace,
        ],
      ),
    );
  }
}
