import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_transcriber_app/src/common_widgets/two_part_text.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';
import 'package:voice_transcriber_app/src/core/localization/string_hardcoded.dart';
import 'package:voice_transcriber_app/src/core/routing/app_router.dart';

import '../../../gen/assets.gen.dart';

part './widgets/splash_screen_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      /// Do some business logic here
      /// For example, check if the user is logged in
      /// If the user is logged in, navigate to the home screen
      /// If the user is not logged in, navigate to the login screen
      /// For now, we will navigate to the home screen
      if (mounted) context.goNamed(AppRoute.home.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Text(
              'Voice Transcriber'.hardcoded,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(8),
            const _LoadingIndicator(),
            Assets.images.voiceTranscriberAplhaLogo.image(
              width: 200,
              height: 200,
            ),
            const Spacer(flex: 2),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}
