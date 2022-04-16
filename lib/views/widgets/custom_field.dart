import 'package:decor_app/utils/const_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatelessWidget {
  CustomField(
      {Key? key,
      this.hint = '',
      this.width,
      this.height,
      this.sIcon,
      this.pIcon,
      this.obscureText = false,
      this.isWordField = true,
      this.maxline,
      this.controller,
      this.contentPadding,
      this.onChanged,
      this.hintstyle,
      this.hintColor,
      this.headtext,
      this.keyboardType,
      this.validate = true,
      this.readonly = false,
      this.autoFocus = false,
      this.inputFormatters,
      this.maxLength,
      this.useNativeKeyboard = true,
      this.fillColor,
      this.onCompleted,
      this.shape = BoxShape.rectangle,
      this.pinPutFieldCount = 0,
      this.focusNode,
      this.validator})
      : super(key: key);

  final Function(String)? onCompleted;
  final String hint;
  final _pinPutFocusNode = FocusNode();
  final Color? fillColor;
  final bool useNativeKeyboard;
  final double? width;
  final double? height;
  final Widget? sIcon;
  final Widget? pIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final Function? validator;
  final TextStyle? hintstyle;
  final Color? hintColor;
  final int? maxline;
  final String? headtext;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool isWordField;
  final bool validate;
  final bool readonly;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final bool autoFocus;
  final BoxShape? shape;
  final FocusNode? focusNode;
  final int? pinPutFieldCount;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    var keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: fillColor ?? Theme.of(context).inputDecorationTheme.fillColor,
      shape: shape ?? BoxShape.rectangle,
      borderRadius:
          shape == BoxShape.circle ? null : BorderRadius.circular(5.0),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headtext == null
            ? const SizedBox.shrink()
            : Text(headtext!,
                style: Theme.of(context).primaryTextTheme.headline5),
        const SizedBox(height: 10),
        Expanded(
            flex: 0,
            //height: inputFieldHeight,
            child: SizedBox(
              width: width,
              height: height,
              child: TextFormField(
                maxLines: maxline ?? 1,
                maxLength: maxLength,
                obscureText: obscureText,
                controller: controller,
                readOnly: readonly,
                autofocus: false,
                focusNode: focusNode,
                scrollPadding: EdgeInsets.only(bottom: keyboardHeight + 20),
                enableSuggestions: true,
                keyboardType: keyboardType ?? TextInputType.text,
                onChanged: onChanged,
                decoration: InputDecoration(
                  contentPadding: contentPadding,
                  filled: true,
                  fillColor: fillColor,
                  errorMaxLines: 6,
                  prefixIcon: pIcon,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(ySpaceMid),
                    child: sIcon,
                  ),
                  hintText: hint,
                  hintStyle: hintstyle ??
                      Theme.of(context)
                          .inputDecorationTheme
                          .hintStyle!
                          .copyWith(
                              color: hintColor ??
                                  Theme.of(context)
                                      .inputDecorationTheme
                                      .hintStyle
                                      ?.color),
                ),
              ),
            )),
      ],
    );
  }
}
