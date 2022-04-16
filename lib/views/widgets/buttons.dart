import 'package:decor_app/styles/app_colors.dart';
import 'package:decor_app/utils/const_values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.actionText,
      this.style,
      this.color,
      this.fillColor,
      this.radius,
      this.width,
      this.height,
      this.disabled = false,
      this.disabledColor,
      this.outLineColor,
      this.isOutline = false,
      required this.onTap})
      : super(key: key);
  final String actionText;
  final Color? color;
  final Color? fillColor;
  final Color? outLineColor;
  final bool isOutline;
  final bool disabled;
  final Color? disabledColor;
  final double? width;
  final double? height;
  final TextStyle? style;
  final double? radius;

  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled) {
          HapticFeedback.heavyImpact();
          onTap!();
        }
      },
      child: Container(
          width: width ?? double.infinity,
          height: height ?? 48,
          decoration: BoxDecoration(
              color: disabled
                  ? disabledColor ??
                      Theme.of(context).canvasColor.withOpacity(0.5)
                  : (isOutline
                      ? Colors.transparent
                      : fillColor ?? Theme.of(context).canvasColor),
              border: isOutline
                  ? Border.all(
                      color: outLineColor ??
                          color ??
                          Theme.of(context).canvasColor.withOpacity(.9))
                  : null,
              borderRadius: BorderRadius.circular(radius ?? 8)),
          alignment: Alignment.center,
          child: Text(
            actionText,
            style: style ??
                Theme.of(context).primaryTextTheme.button?.copyWith(
                    color: isOutline
                        ? color ?? Theme.of(context).canvasColor.withOpacity(.9)
                        : null),
          )),
    );
  }
}

class WordsButton extends StatelessWidget {
  const WordsButton({
    Key? key,
    required this.press,
    required this.firstText,
    required this.secondText,
    this.textAlign,
    this.firstTextColor,
    this.secondTextColor,
    this.textStyle,
    this.textHeight,
    this.underline = TextDecoration.none,
    this.disabled = false,
  }) : super(key: key);

  final Function() press;
  final TextAlign? textAlign;
  final TextDecoration underline;
  final String firstText;
  final double? textHeight;
  final Color? firstTextColor;
  final Color? secondTextColor;
  final bool disabled;
  final String secondText;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      text: TextSpan(
        text: firstText,
        style: textStyle?.copyWith(color: firstTextColor) ??
            Theme.of(context).primaryTextTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: firstTextColor,
                  height: textHeight,
                ),
        children: <TextSpan>[
          TextSpan(
              text: secondText,
              recognizer: TapGestureRecognizer()
                ..onTap = disabled ? null : press,
              style: textStyle?.copyWith(color: secondTextColor) ??
                  Theme.of(context).textTheme.headline4?.copyWith(
                      decoration: underline,
                      fontWeight: FontWeight.w400,
                      height: textHeight,
                      color: secondTextColor)),
        ],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      required this.actionText,
      required this.style,
      required this.onTap})
      : super(key: key);
  final String actionText;
  final TextStyle style;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(actionText, style: style),
    );
  }
}

class IconTextButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const IconTextButton(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
            border: Border.all(color: AppColors.primary)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).primaryTextTheme.headline5,
              ),
              Icon(
                icon,
                color: AppColors.primary,
              )
            ],
          ),
        ));
  }
}
