import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:news_app/res/constant/app_colors.dart';
import 'package:news_app/res/constant/constant.dart';

/// <<< Common App button --------- >>>

class AppButton extends StatelessWidget {
  final String? title;
  final bool? disableButton;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final double? height;
  final double? width;
  final Widget? child;
  final IconData? icon;
  final String? image;

  const AppButton({
    super.key,
    this.title = "",
    required this.onPressed,
    this.onLongPress,
    this.disableButton = false,
    this.height,
    this.width,
    this.child,
    this.icon,
    this.image = "",
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disableButton! ? null : onPressed,
      onLongPress: disableButton! ? null : onLongPress,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            fixedSize: MaterialStatePropertyAll(Size(width ?? Get.width, height ?? 54)),
          ),
      child: child ??
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 5),
              ],
              if (image!.isNotEmpty) ...[
                image!.contains(".svg")
                    ? SvgPicture.asset(
                        image!,
                        height: 22,
                      )
                    : Image.asset(
                        image!,
                        height: 22,
                      ),
                const SizedBox(width: 5)
              ],
              if (title!.isNotEmpty)
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: Constant.fontFamily,
                  ),
                )
            ],
          ),
    );
  }
}

/// <<< To get text View --------- >>>
class MyTextView extends Text {
  final TextAlign? textAlignNew;
  final int? maxLinesNew;
  final TextStyle? textStyleNew;
  final TextOverflow? overflowText;
  final bool? isMaxLineWrap;
  final TextDirection? textAlignment;

  MyTextView(
    String? s, {
    Key? key,
    this.textAlignment,
    this.textAlignNew = TextAlign.start,
    this.maxLinesNew = 1,
    this.overflowText = TextOverflow.ellipsis,
    this.isMaxLineWrap = false,
    this.textStyleNew,
  })  : assert(s != null && maxLinesNew != null),
        super(
          s!,
          key: key,
          textAlign: textAlignNew,
          maxLines: isMaxLineWrap! ? null : maxLinesNew,
          overflow: isMaxLineWrap ? null : overflowText,
          style: textStyleNew,
          textDirection: textAlignment,
        );
}

/// <<< To get text view style --------- >>>
class MyTextStyle extends TextStyle {
  final Color textColor;
  final FontWeight? textWeight;
  final double? textSize;
  final String? textFamily;
  final TextDecoration? textDecorations;
  final Paint? textBackground;
  final double? textLetterSpacing;
  final double? textHeight;
  final FontStyle? textStyle;

  const MyTextStyle({
    this.textHeight,
    this.textColor = AppColors.appRedColor,
    this.textWeight = FontWeight.normal,
    this.textSize = 14,
    this.textFamily = Constant.fontFamily,
    this.textDecorations = TextDecoration.none,
    this.textBackground,
    this.textLetterSpacing = 0.0,
    this.textStyle = FontStyle.normal,
  })  : assert(textColor != null && textWeight != null),
        super(
          color: textColor,
          fontWeight: textWeight,
          fontSize: textSize,
          fontFamily: textFamily,
          decoration: textDecorations,
          background: textBackground,
          letterSpacing: textLetterSpacing,
          height: textHeight,
          fontStyle: textStyle,
        );
}
