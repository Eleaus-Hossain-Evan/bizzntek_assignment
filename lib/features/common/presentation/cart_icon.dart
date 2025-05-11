import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../cart/application/cart_provider.dart';
import '../../cart/presentation/cart_screen.dart';

class CartIcon extends HookConsumerWidget {
  const CartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalCart = ref.watch(totalCartCountProvider);
    return IconButton(
      onPressed: () {
        context.pushNamed(CartScreen.route);
      },
      icon: Badge.count(
        count: totalCart,
        child: Icon(
          Icons.shopping_cart_outlined,
          size: 24.r,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
