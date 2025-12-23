import 'package:assignment_1/config/scales/gap.dart';
import 'package:assignment_1/core/widgets/text-field/custom_reactive_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../features/agents/presentation/providers/transaction_providers.dart';

class AddTransactionDialog extends ConsumerWidget {
  final String agentId;

  AddTransactionDialog({super.key, required this.agentId});

  final FormGroup form = FormGroup({
    'amount': FormControl<double>(
      validators: [Validators.required, Validators.number()],
    ),
    'currency': FormControl<String>(
      value: 'USD',
      validators: [Validators.required],
    ),
    'type': FormControl<String>(
      value: 'credit',
      validators: [Validators.required],
    ),
    'details': FormControl<String>(),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txState = ref.watch(transactionsProvider(agentId));

    return AlertDialog(
      title: Text('Add Transaction'.i18n),
      content: SingleChildScrollView(
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // القيمة
              CustomReactiveTextField<double>(
                formControlName: 'amount',
                labelText: "Amount".i18n,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validationMessages: {
                  ValidationMessage.required: (_) => 'Amount is required',
                },
              ),
              Gap.h16,
              // العملة
              ReactiveDropdownField<String>(
                formControlName: 'currency',
                decoration: InputDecoration(labelText: 'Currency'.i18n),
                items: [
                  DropdownMenuItem(value: 'USD', child: Text('Dollar'.i18n)),
                  DropdownMenuItem(value: 'TRY', child: Text('Trkish'.i18n)),
                  DropdownMenuItem(value: 'EUR', child: Text('Euro'.i18n)),
                ],
              ),
              Gap.h16,
              // القيد (الاستلاف/الدين)
              ReactiveDropdownField<String>(
                formControlName: 'type',
                decoration: InputDecoration(labelText: 'Type'.i18n),
                items: [
                  DropdownMenuItem(
                    value: 'credit',
                    child: Text('Credit'.i18n),
                  ), // استلاف
                  DropdownMenuItem(
                    value: 'debit',
                    child: Text('Debit'.i18n),
                  ), // دين
                ],
              ),
              Gap.h16,
              // التفاصيل
              CustomReactiveTextField<String>(
                formControlName: 'details',
                labelText: "Details (optional)",
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'.i18n),
        ),
        ElevatedButton(
          onPressed: txState.isLoading
              ? null
              : () async {
                  if (!form.valid) {
                    form.markAllAsTouched();
                    return;
                  }

                  await ref
                      .read(transactionsProvider(agentId).notifier)
                      .addTransaction(
                        amount: form.control('amount').value,
                        currency: form.control('currency').value,
                        type: form.control('type').value,
                        details: form.control('details').value,
                      );

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
          child: txState.isLoading
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
