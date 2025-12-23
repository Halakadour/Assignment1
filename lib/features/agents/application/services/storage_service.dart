import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<String> uploadAgentImage({
    required Uint8List bytes,
    required String fileName,
  }) async {
    final path = 'agents/${DateTime.now().millisecondsSinceEpoch}_$fileName';

    await _client.storage
        .from('agents')
        .uploadBinary(
          path,
          bytes,
          fileOptions: const FileOptions(
            upsert: true,
            contentType: 'image/png',
          ),
        );

    return _client.storage.from('agents').getPublicUrl(path);
  }
}
