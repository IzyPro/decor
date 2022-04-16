import 'package:decor_app/styles/app_colors.dart';
import 'package:decor_app/utils/const_values.dart';
import 'package:flutter/material.dart';

class CustomErrorBottomSheet extends StatelessWidget {
  const CustomErrorBottomSheet(
      {Key? key,
      required this.message,
      this.onTap,
      this.fillColor,
      this.retryable = false})
      : super(key: key);
  final String message;
  final Color? fillColor;
  final bool retryable;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: ySpace1),
            child: Text(message,
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.headline4),
          ),
          const SizedBox(height: ySpace3),
          if (retryable)
            GestureDetector(
              onTap: () {
                onTap!();
                Navigator.pop(context);
              },
              child: Container(
                  width: 155,
                  height: 48,
                  decoration: BoxDecoration(
                      color: fillColor ?? AppColors.black,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Text(
                    'Retry',
                    style: Theme.of(context).primaryTextTheme.button,
                  )),
            )
        ],
      ),
    );
  }
}
