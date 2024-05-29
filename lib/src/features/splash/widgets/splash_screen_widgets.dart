part of '../splash_screen.dart';

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TwoPartText(
        context: context,
        firstPart: 'By',
        secondPart: 'EnverErdem',
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
