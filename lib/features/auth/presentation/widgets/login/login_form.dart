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
import 'dont_have_count_row.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(6)],
    ),
    'rememberMe': FormControl<bool>(value: false),
  });

  @override
  Widget build(BuildContext context) {
    // For Listening on Changes
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
    final authRef = ref.watch(authProvider);

    return ReactiveForm(
      formGroup: _form,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SizesConfig.spaceBtwSections,
        ),
        child: Column(
          children: [
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
            const SizedBox(height: SizesConfig.spaceBtwInputFields / 2),
            // Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  children: [
                    ReactiveCheckbox(
                      formControlName: 'rememberMe',
                      semanticLabel: "Remember Me".i18n,
                    ),
                    Text("Remmber me".i18n),
                  ],
                ),
                // Forget Password
                TextButton(
                  onPressed: () {},
                  child: Text("Forget Password ?".i18n),
                ),
              ],
            ),
            const SizedBox(height: SizesConfig.spaceBtwSections),
            Consumer(
              builder: (context, ref, child) => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: authRef.isLoading
                      ? null
                      : () {
                          if (_form.valid) {
                            ref
                                .read(authProvider.notifier)
                                .login(
                                  _form.control('email').value,
                                  _form.control('password').value,
                                );
                          }
                        },
                  child: authRef.isLoading
                      ? const CircularProgressIndicator()
                      : Text("Login".i18n),
                ),
              ),
            ),
            const SizedBox(height: SizesConfig.spaceBtwItems),
            // Move To Sign Up Page
            const DontHaveAccountRow(),
            const SizedBox(height: SizesConfig.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
