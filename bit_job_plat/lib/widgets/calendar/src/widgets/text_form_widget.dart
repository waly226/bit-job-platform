import 'package:bit_job_plat/utils/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import '../../../../values/colors.dart';
import '../../../../values/dimens.dart';
import '../../../../values/style.dart';

class TextFormWidget extends StatelessWidget {
  final String? hintText, errorText;
  final TextStyle? style;
  final Color? fillColor, errorColor;
  final StringValidationCallback ? onValidation;
  final StringValidationCallback? onChanged;
  final Function? onSaved;
  final AsyncCallback? onTap;
  final TextEditingController? textEditingController;
  final int? maxLength;
  final int? maxLines;
  final bool? readOnly;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;

  const TextFormWidget(
      {Key? key,
      this.onChanged,
      this.hintText,
      this.errorText,
      this.maxLength,
      this.textInputType,
      this.onValidation,
      this.onSaved,
      this.readOnly,
      this.maxLines,
      this.textEditingController,
      this.textInputFormatter,
      this.fillColor,
      this.style,
      this.onTap,
      this.errorColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(spacingStandard),
      ),
      child: TextFormField(
        onTap:  (){
          onTap!();
        },
        onChanged: onChanged,
        controller: textEditingController,
        textAlign: TextAlign.start,
        showCursor: true,
        readOnly: false,
        maxLines: maxLines,
        enabled: readOnly != null ? readOnly! : true,
        cursorColor: primaryColor,
        validator: onValidation != null ? onValidation! : null,
        onSaved: onSaved != null ? onSaved!() : null,
        style: style ?? normalTextStyle,
        inputFormatters: textInputFormatter,
        buildCounter: (BuildContext? context,
                {int? currentLength, int? maxLength, bool? isFocused}) =>
            null,
        keyboardType: textInputType,
        maxLength: maxLength,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? Colors.white.withOpacity(0.5),
          hintText: hintText,
          hintStyle: hintTextStyle,
          errorStyle: errorTextStyle.copyWith(color: errorColor ?? errorColor),
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
        ),
      ),
    ).addMarginTop(12);
  }
}
