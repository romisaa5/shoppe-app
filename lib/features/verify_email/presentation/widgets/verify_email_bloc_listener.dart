import 'package:e_commerce_app/core/common/widgets/custom_dialog.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/resend_otp/resend_otp_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/resend_otp/resend_otp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailBlocListener extends StatelessWidget {
  const VerifyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResendOtpCubit, ResendOtpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => _showLoadingDialog(context),
          success: (data) {
            final email = context
                .read<ResendOtpCubit>()
                .emailController
                .text
                .trim();
            _showSuccessDialog(context, email);
          },
          failure: (error) => _showErrorDialog(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: LightAppColors.primaryColor.withOpacity(0.3),
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  void _showErrorDialog(BuildContext context, String error) {
    if (Navigator.canPop(context)) Navigator.pop(context);
    showDialog(
      context: context,
      builder: (_) => CustomAlertDialog(
        dialogColor: Colors.redAccent,
        dialogHeader: 'Resend OTP Failed',
        dialogBody: error,
        dialogIcon: Icons.error,
        press: () => Navigator.pop(context),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String email) {
    if (Navigator.canPop(context)) Navigator.pop(context);

    showDialog(
      context: context,
      builder: (_) => CustomAlertDialog(
        dialogColor: LightAppColors.primaryColor,
        dialogHeader: 'Resend OTP Successful',
        dialogBody:
            'Congratulations! OTP has been sent to your email.\nPlease use it to verify your account.',
        dialogIcon: Icons.check_circle_rounded,
        press: () {
          Navigator.pop(context);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            GoRouter.of(context).push(Routes.otpVerification, extra: email);
          });
        },
      ),
    );
  }
}
