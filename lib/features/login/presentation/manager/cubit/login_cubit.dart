import 'package:e_commerce_app/core/helper/constants.dart';
import 'package:e_commerce_app/core/helper/shared_pref_helper.dart';
import 'package:e_commerce_app/core/networking/dio_factory.dart';
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
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    result.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.accessToken);
        emit(LoginState.success(loginResponse));
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

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(
      key: SharedPrefKeys.userToken,
      value: token,
    );
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
