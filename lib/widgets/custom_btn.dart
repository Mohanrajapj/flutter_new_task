import 'package:api_with_cubit/utils/color_resource.dart';
import 'package:flutter/material.dart';

import '../utils/string_resource.dart';
import 'custom_text.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    this.color,
    this.borderColor,
    this.textColor,
    this.width,
    this.height,
    this.horzPadding,
    this.isDense,
  }) : super(key: key);
  final String? text;
  final double? width;
  final double? height;
  final double? horzPadding;
  final bool? isDense;
  final Function? press;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horzPadding ?? 40,
      ),
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 45,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: borderColor ?? Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.circular(16)),
          primary: Colors.white,
          backgroundColor: color ?? ColorResource.AppColor,
        ),
        onPressed: press as void Function(),
        child: isDense ?? false
            ? const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              )
            : CustomText(
                text ?? "",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: textColor ?? Colors.white,
              ),
      ),
    );
  }
}
