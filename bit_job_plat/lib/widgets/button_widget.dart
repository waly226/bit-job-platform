import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/style.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final double? btnWidth;

  const ButtonWidget({Key? key, this.text, this.onTap, this.btnWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        onPressed: onTap != null ? onTap! : null,
        child: Ink(
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width *
                    (btnWidth != null ? btnWidth! : 0.5),
                minHeight: buttonHeight),
            alignment: Alignment.center,
            child: Text(
              text!,
              textAlign: TextAlign.center,
              style: boldLargeTextStyle.copyWith(
                  color: Colors.white, fontSize: textSizeNormal),
            ),
          ),
        ),
      ),
    );
  }
}
