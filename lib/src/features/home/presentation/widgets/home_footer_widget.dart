import 'package:flutter/material.dart';

import '../../../../common_widgets/two_part_text.dart';

class HomeFooterWidget extends StatelessWidget {
  /// A widget that displays the footer of the home screen.
  ///
  /// * The footer will display the text 'Powered by Whisper AI'.
  ///
  const HomeFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TwoPartText(
            firstPart: 'Powered by',
            secondPart: 'Whisper AI',
            context: context,
          )
        ],
      ),
    );
  }
}
