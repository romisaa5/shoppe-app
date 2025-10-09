import 'package:e_commerce_app/features/login/data/repos/login_repo.dart';
import 'package:e_commerce_app/features/login/presentation/manager/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/networking/api_result.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit(this._loginRepo) : super(LoginState.initial());
  Future<void> login() async {
    emit(LoginState.loading());
    final result = await _loginRepo.login(
      emailController.text,
      passwordController.text,
    );
    result.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(
          LoginState.failure(
            error.apiErrorModel.message ?? 'An unexpected error occurred',
          ),
        );
      },
    );
  }
}
