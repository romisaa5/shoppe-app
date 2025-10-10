import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_otp/verify_otp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../data/models/verify_otp/verify_otp_request_body.dart';
import '../../../data/repos/verify_otp_repo.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyOtpRepo _verifyOtpRepo;
  VerifyOtpCubit(this._verifyOtpRepo) : super(const VerifyOtpState.idle());

  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitVerifyOtpStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const VerifyOtpState.loading());
    try {
      final response = await _verifyOtpRepo.verifyEmail(
        VerifyOtpRequestBody(
          email: emailController.text.trim(),
          otp: otpController.text.trim(),
        ),
      );

      response.when(
        success: (verifyOtpResponse) async {
          emit(VerifyOtpState.success(verifyOtpResponse));
        },
        failure: (error) {
          emit(
            VerifyOtpState.error(
              error:
                  error.apiErrorModel.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );

      response.when(
        success: (signupResponse) async {
          emit(VerifyOtpState.success(signupResponse));
        },
        failure: (error) {
          emit(
            VerifyOtpState.error(
              error:
                  error.apiErrorModel.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        VerifyOtpState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }
}
