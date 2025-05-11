import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/core.dart';

class CartIcon extends HookConsumerWidget {
  const CartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {},
      icon: Badge.count(
        count: 0,
        child: Icon(
          Icons.shopping_cart_outlined,
          size: 24.r,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
