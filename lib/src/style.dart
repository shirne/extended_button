import 'package:flutter/material.dart';

/// Extended style for [ExtendedButton]
class EnhancedButtonStyle {
  /// DecorationImage for button background
  final WidgetStateProperty<DecorationImage>? image;

  /// Gradient for button background
  final WidgetStateProperty<Gradient>? gradient;

  /// Matrix4 trandsform for button
  final WidgetStateProperty<Matrix4>? transform;
  final WidgetStateProperty<BlendMode>? blendMode;

  /// gradient and transform animation duration
  final WidgetStateProperty<Duration> duration;

  /// gradient and transform animation curve
  final WidgetStateProperty<Curve>? curve;

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
    WidgetStateProperty<Duration>? duration,
    this.curve,
    bool? enableSplash,
    bool? enableShadow,
  })  : duration = duration ??
            WidgetStateProperty.all(const Duration(milliseconds: 200)),
        enableSplash = enableSplash ?? image == null,
        enableShadow = enableShadow ?? image == null;

  EnhancedButtonStyle copyWith({
    WidgetStateProperty<DecorationImage>? image,
    WidgetStateProperty<Gradient>? gradient,
    WidgetStateProperty<Matrix4>? transform,
    WidgetStateProperty<BlendMode>? blendMode,
    WidgetStateProperty<Duration>? duration,
    WidgetStateProperty<Curve>? curve,
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
