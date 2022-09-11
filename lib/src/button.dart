import 'package:flutter/material.dart';

import 'style.dart';

const _transparent = Color(0x00ffffff);

class _NullButton extends ElevatedButton {
  const _NullButton() : super(onPressed: null, child: null);

  ButtonStyle defaultStyle(BuildContext context) {
    return defaultStyleOf(context);
  }
}

/// A wrapper of [ElevatedButton] to support
/// gradient background and transform and image background.
class EnhancedButton extends StatelessWidget {
  EnhancedButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    MaterialStatesController? statesController,
    EnhancedButtonStyle? enhancedStyle,
    this.width,
    this.height,
    required this.child,
  })  : statesController = statesController ??
            MaterialStatesController({
              if (onPressed == null) MaterialState.disabled,
            }),
        extendedStyle = enhancedStyle ?? EnhancedButtonStyle(),
        super(key: key);

  /// button width
  final double? width;

  /// button height
  final double? height;

  /// [ElevatedButton] onPressed
  final VoidCallback? onPressed;

  /// [ElevatedButton] onLongPress
  final VoidCallback? onLongPress;

  /// [ElevatedButton] onHover
  final ValueChanged<bool>? onHover;

  /// [ElevatedButton] onFocusChange
  final ValueChanged<bool>? onFocusChange;

  /// [ElevatedButton] style
  /// background and shadow will be remove.
  final ButtonStyle? style;

  /// Button clipBehavior
  final Clip clipBehavior;

  /// [ElevatedButton] focusNode
  final FocusNode? focusNode;

  /// [ElevatedButton] autofocus
  final bool autofocus;

  /// [ElevatedButton] statesController
  final MaterialStatesController statesController;

  /// [ElevatedButton] child
  final Widget? child;

  /// style for ExtendedButton
  final EnhancedButtonStyle extendedStyle;

  /// Make an gradient from theme
  static MaterialStateProperty<Gradient> fromTheme(ThemeData theme) {
    return MaterialStateProperty.all(
      LinearGradient(
        colors: [
          theme.colorScheme.primary,
          theme.colorScheme.secondary,
        ],
      ),
    );
  }

  ButtonStyle _fallbackStyle(BuildContext context) {
    return style ??
        Theme.of(context).elevatedButtonTheme.style ??
        const _NullButton().defaultStyle(context);
  }

  ButtonStyle _noBackgroundStyle(BuildContext context) {
    return _fallbackStyle(context).copyWith(
      backgroundColor: MaterialStateProperty.all(
        _transparent,
      ),
      shadowColor: MaterialStateProperty.all(
        _transparent,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      overlayColor: extendedStyle.enableSplash
          ? null
          : MaterialStateProperty.all(_transparent),
    );
  }

  BoxDecoration _resolveDecoration(
    BuildContext context,
    Set<MaterialState> value,
  ) {
    final buttonStyle = _fallbackStyle(context);
    final border = buttonStyle.shape?.resolve(value);
    BoxShape shape = BoxShape.rectangle;
    BorderRadiusGeometry? borderRadius;
    BoxShadow? shadow;
    if (border is StadiumBorder) {
      borderRadius = BorderRadius.circular(1000);
    } else if (border is BeveledRectangleBorder) {
      borderRadius = border.borderRadius;
    } else if (border is CircleBorder) {
      shape = BoxShape.circle;
      borderRadius = BorderRadius.circular(1000);
    } else if (border is RoundedRectangleBorder) {
      borderRadius = border.borderRadius;
    }

    final elevation = buttonStyle.elevation?.resolve(value);
    final shadowColor = buttonStyle.shadowColor?.resolve(value) ??
        Theme.of(context).shadowColor;
    if (elevation != null && extendedStyle.enableShadow) {
      if (elevation > 0) {
        shadow = BoxShadow(
          color: shadowColor.withAlpha(80),
          offset: Offset(0, elevation / 1.8),
          blurRadius: elevation * 1.5,
          spreadRadius: 0,
          blurStyle: BlurStyle.normal,
        );
      }
    }
    return BoxDecoration(
      color: extendedStyle.image == null
          ? buttonStyle.backgroundColor?.resolve(value)
          : null,
      image: extendedStyle.image?.resolve(value),
      gradient: extendedStyle.gradient?.resolve(value),
      backgroundBlendMode: extendedStyle.blendMode?.resolve(value),
      shape: shape,
      borderRadius: borderRadius,
      boxShadow: shadow != null ? [shadow] : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<MaterialState>>(
      valueListenable: statesController,
      builder: (context, value, child) {
        return AnimatedContainer(
          duration: extendedStyle.duration.resolve(value),
          curve: extendedStyle.curve?.resolve(value) ?? Curves.linear,
          width: width,
          height: height,
          transform: extendedStyle.transform?.resolve(value),
          transformAlignment: Alignment.center,
          clipBehavior: clipBehavior,
          decoration: _resolveDecoration(
            context,
            value,
          ),
          child: child,
        );
      },
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        autofocus: autofocus,
        statesController: statesController,
        style: _noBackgroundStyle(context),
        child: child,
      ),
    );
  }
}
