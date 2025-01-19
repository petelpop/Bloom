import 'package:bloom/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;

  const ShimmerCard({
    Key? key,
    required this.height,
    this.width,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: neutralAccent1.withOpacity(0.4),
      highlightColor: neutralAccent1.withOpacity(0.7),
      child: Container(
        height: height,
        width: width == null ? MediaQuery.of(context).size.width : width ?? 0,
        decoration: BoxDecoration(
          color: neutralGray,
          borderRadius: BorderRadius.circular(
            radius ?? 12,
          ),
        ),
      ),
    );
  }
}
