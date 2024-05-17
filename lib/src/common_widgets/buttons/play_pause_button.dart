import 'package:flutter/material.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';

class PlayPauseButton extends StatefulWidget {
  final Function(bool isRecording)? onStatusChanged;
  final bool enabled;
  final String? warningMessage;
  const PlayPauseButton({
    super.key,
    this.onStatusChanged,
    this.enabled = true,
    this.warningMessage,
  });

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.4,
      height: context.screenWidth * 0.4,
      child: IconButton.filled(
        icon: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _animationController,
        ),
        iconSize: context.screenWidth * 0.2,
        onPressed: widget.enabled
            ? () => _handleOnPressed()
            : () {
                if (widget.warningMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        widget.warningMessage!,
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
      ),
    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
    widget.onStatusChanged?.call(isPlaying);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
