import 'package:flutter/material.dart';

class SideBarTitle extends StatelessWidget {
  const SideBarTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).disabledColor,
          ),
        ),
      ],
    );
  }
}
