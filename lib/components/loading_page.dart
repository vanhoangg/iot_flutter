import 'package:flutter/material.dart';

import '../constants.dart';

class AppLoading extends StatelessWidget {
  final Widget child;
  final bool loading;
  const AppLoading({Key? key, required this.child, required this.loading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: IgnorePointer(
          child: child,
          ignoring: loading,
        )),
        if (loading)
          Positioned.fill(
              child: ColoredBox(
            color: Colors.grey.withOpacity(0.4),
            child: Center(
              child: loadding,
            ),
          ))
      ],
    );
  }
}
