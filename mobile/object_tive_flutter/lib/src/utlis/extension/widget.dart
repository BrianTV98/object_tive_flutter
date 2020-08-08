import 'package:flutter/material.dart';

extension WidgetModifier on Widget {

  // Padding
  Widget padding([double value]) {
    EdgeInsetsGeometry _value = EdgeInsets.all(value??0);
    return Padding(
      padding: _value,
      child: this,
    );
  }

  Widget paddingHorizontal([double value]) {
    EdgeInsetsGeometry _value = EdgeInsets.symmetric(horizontal: value??0);
    return Padding(
      padding: _value,
      child: this,
    );
  }
  Widget paddingVertical([double value]) {
    EdgeInsetsGeometry _value = EdgeInsets.symmetric(vertical: value??0);
    return Padding(
      padding: _value,
      child: this,
    );
  }

  Widget paddingLeft([double value]) {
    EdgeInsetsGeometry _value = EdgeInsets.only(left: value??0);
    return Padding(
      padding: _value,
      child: this,
    );
  }

  Widget paddingRight([double value]) {
    EdgeInsetsGeometry _value = EdgeInsets.only(right: value??0);
    return Padding(
      padding: _value,
      child: this,
    );
  }

  Widget paddingBottom([double value]) {
    EdgeInsetsGeometry _value = EdgeInsets.only(bottom: value??0);
    return Padding(
      padding: _value,
      child: this,
    );
  }

  Widget paddingTop([double value]) {
    EdgeInsetsGeometry _value = EdgeInsets.only(top: value??0);
    return Padding(
      padding: _value,
      child: this,
    );
  }

  Widget paddingTLRB({double top, double left, double right, double bottom}) {
    EdgeInsetsGeometry _value = EdgeInsets.fromLTRB(top??0, left??0, right??0, bottom??0);
    return Padding(
      padding: _value,
      child: this,
    );
  }

  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  Widget cornerRadius(BorderRadiusGeometry radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }
}
