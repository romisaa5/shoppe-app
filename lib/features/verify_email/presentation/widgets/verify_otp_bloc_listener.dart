import 'package:e_commerce_app/core/common/widgets/custom_dialog.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_email/verify_email_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_email/verify_email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';

class VerifyOtpBlocListener extends StatelessWidget {
  const VerifyOtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyEmailCubit, VerifyEmailState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (loginResponse) {
            showSuccessDialog(context);
          },
          error: (error) => _showErrorDialog(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogColor: Colors.redAccent,
        dialogHeader: 'Verification Failed',
        dialogBody: error,
        dialogIcon: Icons.error,
        press: () => Navigator.of(context).pop(),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: LightAppColors.primaryColor.withValues(alpha: 0.3),
      builder: (context) => Center(child: const CircularProgressIndicator()),
    );
  }

  void showSuccessDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogColor: LightAppColors.primaryColor,
        dialogHeader: 'Verification Successful',
        dialogBody:
            'Congratulations, you have verified your email successfully!\nYou can now log in to your account.',
        dialogIcon: Icons.check_circle_rounded,
        press: () {
          Navigator.of(context).pop();
          GoRouter.of(context).go(Routes.loginView);
        },
      ),
    );
  }
}
