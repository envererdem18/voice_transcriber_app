import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_transcriber_app/src/core/localization/string_hardcoded.dart';
import 'package:voice_transcriber_app/src/core/routing/app_router.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Voice Transcriber'.hardcoded),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => context.pushNamed(AppRoute.settings.name),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
