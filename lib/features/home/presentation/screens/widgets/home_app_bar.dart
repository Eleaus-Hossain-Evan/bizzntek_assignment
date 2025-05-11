import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Images.logo.assetImage(
            width: 24.w,
            height: 24.w,
          ),
          SizedBox(width: 12.w),
          const Text('Home'),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge.count(
            count: 0,
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 24.r,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
