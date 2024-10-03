import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final textColor = dark ? Colors.white.withOpacity(0.8) : Colors.black87.withOpacity(0.8);

    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor)
          : Theme.of(context).textTheme.titleSmall!.copyWith(color: textColor),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
