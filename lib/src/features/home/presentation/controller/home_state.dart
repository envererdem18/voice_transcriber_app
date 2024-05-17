import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    Locale? locale,
    String? transcribedText,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      transcribedText: null,
      locale: null,
    );
  }
}
