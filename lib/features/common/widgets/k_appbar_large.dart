import 'package:flutter/material.dart';

import '../../../core/core.dart';

class KAppBarLarge extends StatelessWidget {
  const KAppBarLarge({
    super.key,
    this.innerBoxIsScrolled = false,
    required this.title,
    required this.subtitle,
  });

  final bool innerBoxIsScrolled;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      snap: true,
      pinned: true,
      floating: true,
      backgroundColor: context.color.primary,
      surfaceTintColor: AppColors.black,
      scrolledUnderElevation: 4,
      forceElevated: innerBoxIsScrolled,
      foregroundColor: Colors.white,
      // flexibleSpace: LayoutBuilder(
      //   builder: (BuildContext context, BoxConstraints constraints) {
      //     double h = constraints.biggest.height;
      //     double scrolledPercentage = ((h / 88) - 1).clamp(0, 1);

      //     return FlexibleSpaceBar(
      //       expandedTitleScale: 1.6,
      //       titlePadding: EdgeInsets.only(
      //         left: 36.w + 32.w * (1 - scrolledPercentage),
      //         right: 16.w,
      //         bottom:
      //             (16 * scrolledPercentage) + 10.h * (1 - scrolledPercentage),
      //       ),
      //       collapseMode: CollapseMode.pin,
      //       stretchModes: const [
      //         StretchMode.zoomBackground,
      //         StretchMode.fadeTitle,
      //         StretchMode.blurBackground,
      //       ],
      //       title: SafeArea(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             AppText(
      //               title,
      //               style: ContentTextStyle.headline4.colorWhite(),
      //               maxLines: scrolledPercentage < .3 ? 1 : null,
      //               overflow: TextOverflow.ellipsis,
      //               softWrap: true,
      //             ),
      //             // Show subtitle if scrolledPercentage is above a threshold (e.g., 0.5)
      //             (2 * (scrolledPercentage)).verticalSpace,
      //             AnimatedCrossFade(
      //               firstChild: const SizedBox.shrink(),
      //               alignment: Alignment.bottomLeft,
      //               secondChild: Text(
      //                 subtitle,
      //                 style: ContentTextStyle.bodyText2.colorWhite(),
      //               ),
      //               crossFadeState: scrolledPercentage > 0.5
      //                   ? CrossFadeState.showSecond
      //                   : CrossFadeState.showFirst,
      //               duration: Durations.short2,
      //             )
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
