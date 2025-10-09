import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_service.dart';
import 'package:e_commerce_app/core/networking/dio_factory.dart';
import 'package:e_commerce_app/features/login/data/repos/login_repo.dart';
import 'package:e_commerce_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:e_commerce_app/features/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/features/verify_email/data/repos/verify_otp_repo.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/cubit/verify_otp_cubit.dart';
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
}
