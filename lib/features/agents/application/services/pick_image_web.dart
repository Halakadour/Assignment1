import 'dart:typed_data';
import 'package:image_picker_web/image_picker_web.dart';

Future<(Uint8List, String)?> pickImage() async {
  final bytes = await ImagePickerWeb.getImageAsBytes();

  if (bytes == null) return null;

  return (bytes, 'agent.png');
}
