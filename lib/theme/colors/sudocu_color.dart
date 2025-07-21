import 'package:flutter/material.dart';

@immutable
class SudocuColor extends Color implements WidgetStateProperty<Color> {
  const SudocuColor(
    super.value, {
    Color? light,
    Color? dark,
    Color? hover,
    Color? pressed,
    Color? disabled,
  })  : _light = light,
        _dark = dark,
        _hover = hover,
        _pressed = pressed,
        _disabled = disabled;

  final Color? _light;
  final Color? _dark;
  final Color? _hover;
  final Color? _pressed;
  final Color? _disabled;

  Color get light => _light ?? this;
  Color get dark => _dark ?? this;
  Color get hover => _hover ?? this;
  Color get pressed => _pressed ?? this;
  Color get disabled => _disabled ?? this;

  @override
  int get hashCode => Object.hash(
        value,
        _light,
        _dark,
        _hover,
        _pressed,
        _disabled,
      );

  @override
  bool operator ==(Object other) =>
      other is SudocuColor &&
      value == other.value &&
      _light == other._light &&
      _dark == other._dark &&
      _hover == other._hover &&
      _pressed == other._pressed &&
      _disabled == other._disabled;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return disabled;

    if (states.contains(WidgetState.pressed) || states.contains(WidgetState.dragged)) {
      return pressed;
    }
    
    if (states.contains(WidgetState.hovered) || states.contains(WidgetState.focused)) {
      return hover;
    }

    return this;
  }
}

extension SudocuColorExtensions on SudocuColor {
  SudocuColor lerp(SudocuColor? other, double t) {
    return SudocuColor(
      Color.lerp(this, other, t)!.value,
      light: Color.lerp(_light, other?._light, t),
      dark: Color.lerp(_dark, other?._dark, t),
      hover: Color.lerp(_hover, other?._hover, t),
      pressed: Color.lerp(_pressed, other?._pressed, t),
      disabled: Color.lerp(_disabled, other?._disabled, t),
    );
  }
}