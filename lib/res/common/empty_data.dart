import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// <<< To show empty data message or image --------- >>>

class EmptyData extends StatelessWidget {
  final bool? showImage;
  final Widget? imageWidget;
  final double? imageHeight;
  final String? title;
  final String? subTitle;

  const EmptyData({
    super.key,
    this.showImage = true,
    this.imageWidget,
    this.title,
    this.subTitle,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showImage!) ...[
          const SizedBox(height: 15.0),
          imageWidget ??
              Lottie.asset(
                "", // Set your defult lottie image hear
                height: imageHeight ?? 200,
              ),
          const SizedBox(height: 15.0),
        ],
        Text(
          title ?? 'No Data Found.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        const SizedBox(height: 15.0 / 2),
        Text(
          subTitle ?? 'There is no data a this moment.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!,
        ),
      ],
    );
  }
}
