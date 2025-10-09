import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:e_commerce_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:e_commerce_app/features/sign_up/presentation/manager/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        firstName: firstNameController.text,
        email: emailController.text,
        lastName: lastNameController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (signupResponse) {
        emit(SignupState.signupSuccess(signupResponse));
      },
      failure: (error) {
        emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
