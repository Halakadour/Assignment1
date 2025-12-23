import 'dart:typed_data';

import 'package:assignment_1/config/scales/gap.dart';
import 'package:assignment_1/translation/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../features/agents/application/services/pick_image_web.dart';
import '../../../../features/agents/presentation/providers/agent_providers.dart';
import '../../text-field/custom_reactive_text_field.dart';

class AddAgentDialog extends ConsumerStatefulWidget {
  const AddAgentDialog({super.key});

  @override
  ConsumerState<AddAgentDialog> createState() => _AddAgentDialogState();
}

class _AddAgentDialogState extends ConsumerState<AddAgentDialog> {
  final FormGroup form = FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required, Validators.minLength(3)],
    ),
  });

  final ValueNotifier<Uint8List?> imageNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    final agentsState = ref.watch(agentsProvider);

    return AlertDialog(
      title: Text('Add agent'.i18n),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder<Uint8List?>(
            valueListenable: imageNotifier,
            builder: (_, image, __) {
              return GestureDetector(
                onTap: () async {
                  final result = await pickImage();
                  if (result == null) return;

                  imageNotifier.value = result.$1;
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: image != null
                        ? DecorationImage(
                            image: MemoryImage(image),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: Colors.transparent,
                    border: Border.all(color: Theme.of(context).dividerColor),
                    shape: BoxShape.circle,
                  ),
                  child: image == null
                      ? Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).dividerColor,
                        )
                      : null,
                ),
              );
            },
          ),
          Gap.h16,
          ReactiveForm(
            formGroup: form,
            child: CustomReactiveTextField(
              formControlName: 'name',
              labelText: 'Agent name'.i18n,
              validationMessages: {
                ValidationMessage.required: (_) => 'name is required'.i18n,
                ValidationMessage.minLength: (_) => 'name is too short'.i18n,
              },
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'.i18n),
        ),
        ElevatedButton(
          onPressed: agentsState.isLoading
              ? null
              : () async {
                  if (!form.valid) {
                    form.markAllAsTouched();
                    return;
                  }
                  await ref
                      .read(agentsProvider.notifier)
                      .addAgentWithImage(
                        name: form.control('name').value,
                        imageBytes: imageNotifier.value,
                      );

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
          child: agentsState.isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('Save'.i18n),
        ),
      ],
    );
  }
}
