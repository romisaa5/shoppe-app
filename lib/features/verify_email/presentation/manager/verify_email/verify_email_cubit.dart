import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/verify_email/data/models/verify_email/verify_email_request_body.dart';
import 'package:e_commerce_app/features/verify_email/data/repos/verify_email_ropo.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_email/verify_email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final VerifyEmailRopo _verifyEmailRopo;
  VerifyEmailCubit(this._verifyEmailRopo) : super(VerifyEmailState.initial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  void emitVerifyEmailStates() async {
    emit(VerifyEmailState.loading());
    try {
      final response = await _verifyEmailRopo.verifyEmail(
        VerifyEmailRequestBody(
          email: emailController.text,
          otp: otpController.text,
        ),
      );
      response.when(
        success: (data) {
          emit(VerifyEmailState.success(data));
        },
        failure: (error) {
          emit(
            VerifyEmailState.error(
              error:
                  error.apiErrorModel.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (e) {
      emit(
        VerifyEmailState.error(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }
}
