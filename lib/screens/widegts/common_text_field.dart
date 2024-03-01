import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ffi';

class CommonTextField extends StatelessWidget {
  final TextEditingController descriptionController;
  final String labelText;
  final String hintText;
  final FocusNode focusNode;
  final int? maxLine;
  final bool isEnabled;
  final bool? readOnly;
  final bool showSuffixIcon;
  final double horizontalPaddingToTextField;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final Color textInputColor;
  final double? fontSize;
  final int? maxLength;
  final double? contentPaddingHorizontal;
  final String? prefixText;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final StringCallBackFunction validation;
  final StringCallBackFunction? onChange;
  final StringCallBackFunction? onFieldSubmitted;
  final VoidCallBackFunction? onEditingComplete;
  final VoidCallBackFunction? onTap;

  const CommonTextField({
    required this.descriptionController,
    required this.labelText,
    required this.horizontalPaddingToTextField,
    required this.textInputType,
    required this.textInputColor,
    required this.validation,
    required this.isEnabled,
    required this.focusNode,
    Key? key,
    this.contentPaddingHorizontal,
    this.onChange,
    this.fontSize,
    this.maxLength,
    this.prefixText,
    this.textInputAction,
    this.inputFormatters,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.showSuffixIcon = false,
    this.onTap,
    this.textAlign,
    this.suffixIcon,
    this.readOnly,
    this.hintText = '',
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Container(
          // height: sizes.heightRatio * 46,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              scrollPadding: EdgeInsets.zero,
              inputFormatters: inputFormatters ?? [],
              onTap: onTap,
              maxLines: maxLine,
              maxLength: maxLength,
              textAlign: textAlign ?? TextAlign.start,
              controller: descriptionController,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              readOnly: readOnly ?? false,
              enabled: isEnabled,
              onChanged: onChange,
              onEditingComplete: onEditingComplete,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixText: prefixText ?? '',
                counterText: '',
                prefixStyle: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'montserratRegular',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                ),
                hintText: hintText,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
                contentPadding: EdgeInsets.zero,
                suffixIcon: showSuffixIcon == true
                    ? suffixIcon ??
                        const Icon(
                          CupertinoIcons.chevron_down,
                          color: Colors.black,
                        )
                    : null,
              ),
              keyboardType: textInputType,
              textInputAction: textInputAction ?? TextInputAction.done,
              focusNode: focusNode,
              onFieldSubmitted: onFieldSubmitted ??
                  (value) {
                    focusNode.unfocus();
                  },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => validation(value!),
            ),
          ),
        ),
      ],
    );
  }
}

// No return type with string argument function
typedef VoidStringCallBackFunction = void Function(String);

typedef VoidBoolCallBackFunction = void Function(Bool);

typedef VoidCallBackFunction = void Function();

typedef StringCallBackFunction = String? Function(String);
