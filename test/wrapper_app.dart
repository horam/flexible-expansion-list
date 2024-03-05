import 'package:flutter/material.dart';

class WrapperApp extends StatelessWidget {
  const WrapperApp({
    required this.child,
  });

  /// The tested widget.
  final Widget child;

  @override
  Widget build(Object context) => MaterialApp(
        home: Scaffold(body: child),
      );
}
