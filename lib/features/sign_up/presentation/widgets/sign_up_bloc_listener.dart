import 'package:e_commerce_app/core/common/widgets/custom_dialog.dart';
import 'package:e_commerce_app/features/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/features/sign_up/presentation/manager/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,

      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () => _showLoadingDialog(context),
          signupSuccess: (loginResponse) {
            showSuccessDialog(context);
          },
          signupError: (error) => _showErrorDialog(context, error),
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
        dialogHeader: 'Signup Failed',
        dialogBody: error,
        dialogIcon: Icons.error,
        press: () => context.pop(),
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
    context.pop();
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        dialogColor: LightAppColors.primaryColor,
        dialogHeader: 'Signup Successful',
        dialogBody:
            'Congratulations, you have signed up successfully!\nAn OTP has been sent to your email inbox. Please use it to verify your email.',
        dialogIcon: Icons.check_circle_rounded,
        press: () {
          context.pop();
          GoRouter.of(context).pushReplacement(
            Routes.otpVerification,
            extra: context.read<SignupCubit>().emailController.text.trim(),
          );
        },
      ),
    );
  }
}
