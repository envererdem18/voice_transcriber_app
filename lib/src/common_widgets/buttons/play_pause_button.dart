import 'package:flutter/material.dart';
import 'package:voice_transcriber_app/src/core/extensions/build_context_extension.dart';

class PlayPauseButton extends StatefulWidget {
  /// A callback that will be called when the button is pressed.
  final Function(bool isRecording)? onStatusChanged;
  final bool enabled;
  final bool isLoading;

  /// A widget that displays a play/pause button.
  ///
  /// The button will display a loading indicator if [isLoading] is true.
  /// The button will animate between the play and pause icons.
  ///
  /// The [onStatusChanged] callback will be called when the button is pressed.
  /// The callback will receive a boolean value indicating the current status of the button.
  const PlayPauseButton({
    super.key,
    this.onStatusChanged,
    this.enabled = true,
    this.isLoading = false,
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
        icon: widget.isLoading
            ? const CircularProgressIndicator()
            : AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _animationController,
              ),
        iconSize: context.screenWidth * 0.2,
        onPressed: widget.enabled ? () => _handleOnPressed() : null,
      ),
    );
  }

  void _handleOnPressed() {
    if (widget.isLoading) return;
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
