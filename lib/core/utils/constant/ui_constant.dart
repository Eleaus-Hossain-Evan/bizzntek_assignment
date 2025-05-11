import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double defaultBorderRadius = 12.00.r;
double defaultOutsideMarin = 8.00.w;

Divider divider({
  Color? color,
  double thickness = 1,
}) =>
    Divider(
      height: 2.h,
      thickness: thickness,
      color: color,
    );

MainAxisAlignment mainStart = MainAxisAlignment.start;
MainAxisAlignment mainCenter = MainAxisAlignment.center;
MainAxisAlignment mainEnd = MainAxisAlignment.end;
MainAxisAlignment mainSpaceBetween = MainAxisAlignment.spaceBetween;
MainAxisAlignment mainSpaceEven = MainAxisAlignment.spaceEvenly;
MainAxisAlignment mainSpaceAround = MainAxisAlignment.spaceAround;

MainAxisSize mainMax = MainAxisSize.max;
MainAxisSize mainMin = MainAxisSize.min;

CrossAxisAlignment crossStart = CrossAxisAlignment.start;
CrossAxisAlignment crossCenter = CrossAxisAlignment.center;
CrossAxisAlignment crossEnd = CrossAxisAlignment.end;
CrossAxisAlignment crossStretch = CrossAxisAlignment.stretch;
