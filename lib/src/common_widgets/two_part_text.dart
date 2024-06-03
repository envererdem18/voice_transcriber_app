import 'package:flutter/material.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';

class TwoPartText extends RichText {
  /// A widget that displays a text with two parts.
  ///
  /// * The [firstPartStyle] will default to [context.textTheme.bodySmall].
  /// * The [secondPartStyle] will default to [context.textTheme.bodyMedium] with bold font weight.
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
