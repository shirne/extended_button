import 'package:flutter/material.dart';

/// Extended style for [ExtendedButton]
class EnhancedButtonStyle {
  /// DecorationImage for button background
  final MaterialStateProperty<DecorationImage>? image;

  /// Gradient for button background
  final MaterialStateProperty<Gradient>? gradient;

  /// Matrix4 trandsform for button
  final MaterialStateProperty<Matrix4>? transform;
  final MaterialStateProperty<BlendMode>? blendMode;

  /// gradient and transform animation duration
  final MaterialStateProperty<Duration> duration;

  /// gradient and transform animation curve
  final MaterialStateProperty<Curve>? curve;

  /// force enable splash.
  /// splash was disabled when use image.
  final bool enableSplash;

  /// force enable shadow.
  /// shadow was disabled when use image.
  final bool enableShadow;

  EnhancedButtonStyle({
    this.image,
    this.gradient,
    this.transform,
    this.blendMode,
    MaterialStateProperty<Duration>? duration,
    this.curve,
    bool? enableSplash,
    bool? enableShadow,
  })  : duration = duration ??
            MaterialStateProperty.all(
              const Duration(milliseconds: 200),
            ),
        enableSplash = enableSplash ?? image == null,
        enableShadow = enableShadow ?? image == null;

  EnhancedButtonStyle copyWith({
    MaterialStateProperty<DecorationImage>? image,
    MaterialStateProperty<Gradient>? gradient,
    MaterialStateProperty<Matrix4>? transform,
    MaterialStateProperty<BlendMode>? blendMode,
    MaterialStateProperty<Duration>? duration,
    MaterialStateProperty<Curve>? curve,
    bool? enableSplash,
    bool? enableShadow,
  }) {
    return EnhancedButtonStyle(
      image: image ?? this.image,
      gradient: gradient ?? this.gradient,
      transform: transform ?? this.transform,
      blendMode: blendMode ?? this.blendMode,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      enableSplash: enableSplash ?? this.enableSplash,
      enableShadow: enableShadow ?? this.enableShadow,
    );
  }
}
