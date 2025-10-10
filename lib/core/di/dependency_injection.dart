import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_service.dart';
import 'package:e_commerce_app/core/networking/dio_factory.dart';
import 'package:e_commerce_app/features/login/data/repos/login_repo.dart';
import 'package:e_commerce_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:e_commerce_app/features/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/features/verify_email/data/repos/resend_otp_repo.dart';
import 'package:e_commerce_app/features/verify_email/data/repos/verify_email_ropo.dart';
import 'package:e_commerce_app/features/verify_email/data/repos/verify_otp_repo.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/resend_otp/resend_otp_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_email/verify_email_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_otp/verify_otp_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupDependencyInjection() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // Verify Otp
  getIt.registerLazySingleton<VerifyOtpRepo>(() => VerifyOtpRepo(getIt()));
  getIt.registerFactory<VerifyOtpCubit>(() => VerifyOtpCubit(getIt()));

  // Verify Email
  getIt.registerLazySingleton<VerifyEmailRopo>(() => VerifyEmailRopo(getIt()));
  getIt.registerFactory<VerifyEmailCubit>(() => VerifyEmailCubit(getIt()));

  // Resend Otp
  getIt.registerLazySingleton<ResendOtpRepo>(() => ResendOtpRepo(getIt()));
  getIt.registerFactory<ResendOtpCubit>(() => ResendOtpCubit(getIt()));
}
