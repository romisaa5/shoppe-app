import 'package:e_commerce_app/features/verify_email/data/models/resend_otp/resend_otp_request_body.dart';
import 'package:e_commerce_app/features/verify_email/data/repos/resend_otp_repo.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/resend_otp/resend_otp_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ResendOtpRepo resendOtpRepo;

  ResendOtpCubit(this.resendOtpRepo) : super(ResendOtpState.initial());
  Future<void> resendOtp(String email) async {
    emit(ResendOtpState.loading());
    try {
      await resendOtpRepo.resendOtp(ResendOtpRequestBody(email: email));
      emit(ResendOtpState.success());
    } catch (e) {
      emit(ResendOtpState.failure(e.toString()));
    }
  }
}
