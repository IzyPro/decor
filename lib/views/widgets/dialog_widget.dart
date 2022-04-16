import 'package:decor_app/utils/assets.dart';
import 'package:decor_app/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogWidgets {
  static Future modalBottomSheetMenu(BuildContext context, Widget child,
      {bool isError = false,
      isMessage = false,
      showDrag = true,
      dismiss = true,
      Color? svgColor,
      bool showIcon = true,
      bool isScrollControlled = false,
      asset}) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: isScrollControlled,
        isDismissible: dismiss,
        useRootNavigator: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(bottomSheetBorderRadius),
          ),
        ),
        builder: (builder) {
          return Container(
              height: bottomSheetHeight,
              padding: const EdgeInsets.symmetric(
                  horizontal: generalHorizontalPadding),
              margin: isScrollControlled
                  ? EdgeInsets.only(
                      bottom: MediaQuery.of(builder).viewInsets.bottom,
                    )
                  : null,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(bottomSheetBorderRadius),
                      topRight: Radius.circular(bottomSheetBorderRadius))),
              child: Column(
                children: [
                  if (showDrag)
                    const SizedBox(
                      height: ySpace3,
                    ),
                  if (showDrag)
                    Container(
                      width: 100,
                      height: 4,
                      color: Theme.of(context).drawerTheme.backgroundColor,
                    ),
                  const SizedBox(
                    height: 45,
                  ),
                  if (showIcon)
                    SvgPicture.asset(
                      isError ? errorIcon : successIcon,
                      color: isError
                          ? Colors.redAccent
                          : Theme.of(context).primaryColor,
                    ),
                  const SizedBox(height: ySpace3),
                  child
                ],
              ));
        });
  }

  static Future dialog(Widget child, BuildContext ctx, bool dismiss) {
    return showDialog(
        context: ctx,
        barrierDismissible: dismiss,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(
                horizontal: generalHorizontalPadding),
            child: child,
          );
        });
  }
}
