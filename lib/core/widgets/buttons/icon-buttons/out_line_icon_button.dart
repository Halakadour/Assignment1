import 'package:flutter/material.dart';

class OutLineIconButton extends StatelessWidget {
  const OutLineIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.0),
          side: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      icon: icon,
    );
  }
}
