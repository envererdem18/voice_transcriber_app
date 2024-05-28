import 'package:flutter/material.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';

class TwoPartText extends RichText {
  TwoPartText({
    super.key,
    required BuildContext context,
    required String firstPart,
    required String secondPart,
    TextStyle? firstPartStyle,
    TextStyle? secondPartStyle,
  }) : super(
          text: TextSpan(
            children: [
              TextSpan(
                text: firstPart,
                style: firstPartStyle ?? context.textTheme.bodySmall,
              ),
              TextSpan(
                text: ' $secondPart',
                style: secondPartStyle ??
                    context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
}
