// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:sub_manager_app/services/api_exception_handler.dart';
import 'package:sub_manager_app/services/third_party_services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sub_manager_app/services/icon_service.dart';
import 'package:sub_manager_app/services/user_auth_service.dart';
import 'package:sub_manager_app/services/validation_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<ApiExceptionHandler>(() => ApiExceptionHandler());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<IconService>(() => IconService());
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<UserAuthService>(() => UserAuthService());
  g.registerLazySingleton<ValidationService>(() => ValidationService());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
