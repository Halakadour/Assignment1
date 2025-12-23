import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../features/agents/application/services/pick_image_web.dart';

class SelectImageAvatar extends StatefulWidget {
  const SelectImageAvatar({super.key});

  @override
  State<SelectImageAvatar> createState() => _SelectImageAvatarState();
}

class _SelectImageAvatarState extends State<SelectImageAvatar> {
  final ValueNotifier<Uint8List?> imageNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Uint8List?>(
      valueListenable: imageNotifier,
      builder: (_, image, __) {
        return GestureDetector(
          onTap: () async {
            final result = await pickImage();
            if (result == null) return;

            imageNotifier.value = result.$1;
          },
          child: CircleAvatar(
            radius: 40,
            backgroundImage: image != null ? MemoryImage(image) : null,
            child: image == null ? const Icon(Icons.camera_alt) : null,
          ),
        );
      },
    );
  }
}
