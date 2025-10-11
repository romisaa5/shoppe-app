import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_service.dart';
import 'package:e_commerce_app/features/categories/data/repos/category_repo.dart';
import 'package:e_commerce_app/features/categories/presentation/manager/category_cubit/category_cubit.dart';
import 'package:e_commerce_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:e_commerce_app/features/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/resend_otp/resend_otp_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_otp/verify_otp_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/verify_email/data/repos/resend_otp_repo.dart';
import '../../features/verify_email/data/repos/verify_otp_repo.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // Resend Otp
  getIt.registerLazySingleton<ResendOtpRepo>(() => ResendOtpRepo(getIt()));
  getIt.registerFactory<ResendOtpCubit>(() => ResendOtpCubit(getIt()));

  // Verify Otp
  getIt.registerLazySingleton<VerifyOtpRepo>(() => VerifyOtpRepo(getIt()));
  getIt.registerFactory<VerifyOtpCubit>(() => VerifyOtpCubit(getIt()));

  // Brands
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));
}
