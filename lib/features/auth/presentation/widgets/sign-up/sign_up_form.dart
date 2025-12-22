import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../config/router/app_route_config.dart';
import '../../../../../config/scales/sizes_config.dart';
import '../../../../../core/widgets/dialog/status/error_dialog.dart';
import '../../../../../core/widgets/dialog/status/success_dialog.dart';
import '../../../../../core/widgets/text-field/custom_reactive_text_field.dart';
import '../../../domain/models/user_model.dart';
import '../../providers/auth_providers.dart';
import '../../providers/toggle_provider.dart';
import 'already_have_account_row.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _form = FormGroup(
    {
      'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)],
      ),
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)],
      ),
      'confirm': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)],
      ),
    },
    validators: [Validators.mustMatch('password', 'confirm')],
  );

  @override
  Widget build(BuildContext context) {
    // 👂 Listener (بديل BlocListener)
    ref.listen<AsyncValue<UserModel?>>(authProvider, (prev, next) {
      if (prev == null) return;
      next.whenOrNull(
        data: (data) {
          if (data != null) {
            showSuccessDialog(context, () {
              context.pushReplacementNamed(AppRouteConfig.agents);
            });
          }
        },
        error: (e, _) {
          showErrorDialog(context, e.toString());
        },
      );
    });

    final authState = ref.watch(authProvider);

    return ReactiveForm(
      formGroup: _form,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SizesConfig.spaceBtwSections,
        ),
        child: Column(
          children: [
            // Full Name
            CustomReactiveTextField(
              formControlName: 'name',
              labelText: "Full Name".i18n,
              hintText: "Enter your name".i18n,
              prefixIcon: Icons.person,
              validationMessages: {
                ValidationMessage.required: (e) => "Name is required".i18n,
                ValidationMessage.minLength: (e) =>
                    "Name must be at least 6 characters".i18n,
              },
            ),
            const SizedBox(height: SizesConfig.spaceBtwInputFields),
            // Email
            CustomReactiveTextField(
              formControlName: 'email',
              labelText: "Email".i18n,
              hintText: "Enter your email".i18n,
              prefixIcon: Icons.email,
              validationMessages: {
                ValidationMessage.required: (e) => "Email is required".i18n,
                ValidationMessage.email: (e) => "Email is invalid".i18n,
              },
            ),
            const SizedBox(height: SizesConfig.spaceBtwInputFields),

            // Password
            Consumer(
              builder: (context, ref, child) {
                final isVisible = ref.watch(toggleProvider);
                return CustomReactiveTextField(
                  formControlName: 'password',
                  labelText: "Password".i18n,
                  hintText: "Enter your password".i18n,
                  prefixIcon: Icons.lock,
                  obscureText: !isVisible,
                  suffixIcon: isVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onPressedSuffixIcon: () =>
                      ref.read(toggleProvider.notifier).toggle(),
                  validationMessages: {
                    ValidationMessage.required: (e) =>
                        "Password is required".i18n,
                    ValidationMessage.minLength: (e) =>
                        "Password must be at least 6 characters".i18n,
                  },
                );
              },
            ),
            const SizedBox(height: SizesConfig.spaceBtwInputFields),

            // Confirm Password
            Consumer(
              builder: (context, ref, child) {
                final isVisible = ref.watch(toggleProvider);
                return CustomReactiveTextField(
                  formControlName: 'confirm',
                  labelText: "Confirm Password".i18n,
                  hintText: "Rewrite your password".i18n,
                  prefixIcon: Icons.lock,
                  obscureText: !isVisible,
                  suffixIcon: isVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onPressedSuffixIcon: () =>
                      ref.read(toggleProvider.notifier).toggle(),
                  validationMessages: {
                    ValidationMessage.mustMatch: (e) =>
                        "Passwords do not match".i18n,
                  },
                );
              },
            ),

            const SizedBox(height: SizesConfig.spaceBtwSections),

            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: authState.isLoading
                    ? null
                    : () {
                        if (_form.valid) {
                          ref
                              .read(authProvider.notifier)
                              .register(
                                _form.control('name').value,
                                _form.control('email').value,
                                _form.control('password').value,
                              );
                        }
                      },
                child: authState.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text("Sign Up".i18n),
              ),
            ),
            const SizedBox(height: SizesConfig.spaceBtwItems),
            // Move To Login Page
            const AlreadyHaveAccountRow(),
            const SizedBox(height: SizesConfig.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
