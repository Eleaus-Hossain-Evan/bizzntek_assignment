import 'package:flutter/material.dart';

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.hasFocus &&
            currentFocus.focusedChild != null &&
            currentFocus.focusedChild!.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
