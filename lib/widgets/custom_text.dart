import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final String font;
  final Color color;
  final double lineHeight;
  final TextAlign textAlign;
  final GestureTapCallback? onTap;
  final bool isUnderLine;
  final bool isSingleLine;
  final int? maxLines;
  final bool allowCopy;
  final bool isSelectableText;
  final String? copyText;
  final bool isLineThrough;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const CustomText(
    this.text, {
    Key? key,
    this.fontSize = 14,
    this.font = "Barlow",
    this.color = const Color(0xff000000),
    this.lineHeight = 1.21,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.isUnderLine = false,
    this.isSingleLine = false,
    this.maxLines,
    this.allowCopy = false,
    this.isSelectableText = false,
    this.isLineThrough = false,
    this.copyText,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Text textWidget = Text(
      text ?? "",
      textAlign: textAlign,
      overflow: isSingleLine ? TextOverflow.ellipsis : null,
      softWrap: true,
      maxLines: maxLines,
      style: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          decoration: isLineThrough
              ? TextDecoration.lineThrough
              : isUnderLine
                  ? TextDecoration.underline
                  : TextDecoration.none,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          fontSize: fontSize,
          height: lineHeight,
        ),
      ),
    );

    final SelectableText selectableText = SelectableText(
      text ?? "",
      textAlign: textAlign,
      showCursor: true,
      maxLines: maxLines,
      toolbarOptions: const ToolbarOptions(copy: true, selectAll: true),
      style: GoogleFonts.getFont(
        font,
        textStyle: TextStyle(
          decoration: isLineThrough
              ? TextDecoration.lineThrough
              : isUnderLine
                  ? TextDecoration.underline
                  : TextDecoration.none,
          color: color,
          fontSize: fontSize,
          height: lineHeight,
        ),
      ),
    );

    if (onTap != null || allowCopy) {
      return GestureDetector(
        onTap: onTap,
        onLongPress: allowCopy ? () {} : null,
        child: isSelectableText ? selectableText : textWidget,
      );
    }
    return isSelectableText ? selectableText : textWidget;
  }
}
