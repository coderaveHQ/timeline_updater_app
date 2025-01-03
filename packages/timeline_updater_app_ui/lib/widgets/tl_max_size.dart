import 'package:flutter/material.dart';

/// A widget for constraining the size of the child widget
class TLMaxSize extends StatelessWidget {

  /// The maximum width
  final double width;

  /// The maximum height
  final double height;

  /// The child widget that needs to be constrained
  final Widget child;
  
  /// Constructor for passing a Size object
  TLMaxSize.size({
    super.key,
    required Size size,
    required this.child
  })  : width = size.width,
        height = size.height;

  /// Constructor for passing a width
  const TLMaxSize.width({
    super.key,
    required this.width,
    required this.child
  })  : height = double.infinity;

  /// Constructor for passing an height
  const TLMaxSize.height({
    super.key,
    required this.height,
    required this.child
  })  : width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width,
        maxHeight: height
      ),
      child: child
    );
  }
}