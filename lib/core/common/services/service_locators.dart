
import 'package:core_project/core/logic/settings_logic.dart';
import 'package:core_project/core/shared/user/data/datasource/local/user_local_datasource_implementation.dart';
import 'package:core_project/core/shared/user/data/datasource/remote/user_remote_datasource_implementation.dart';
import 'package:core_project/core/shared/user/data/repositories/local/user_local_repository_implementation.dart';
import 'package:core_project/core/shared/user/data/repositories/remote/user_remote_repository_implementation.dart';
import 'package:core_project/core/shared/user/domain/usecases/local/user_local_usecase.dart';
import 'package:core_project/core/shared/user/domain/usecases/local/user_local_usecase_implementation.dart';
import 'package:core_project/core/shared/user/domain/usecases/remote/user_remote_usecase.dart';
import 'package:core_project/core/shared/user/domain/usecases/remote/user_remote_usecase_implementation.dart';
import 'package:core_project/features/auth/data/datasource/local/auth_local_datasource_implementation.dart';
import 'package:core_project/features/auth/data/datasource/remote/auth_remote_datasource_implementation.dart';
import 'package:core_project/features/auth/data/repositories/local/auth_local_repository_implementation.dart';
import 'package:core_project/features/auth/data/repositories/remote/auth_remote_repository_implementation.dart';
import 'package:core_project/features/auth/domain/usecases/local/auth_local_usecase.dart';
import 'package:core_project/features/auth/domain/usecases/local/auth_local_usecase_implementation.dart';
import 'package:core_project/features/auth/domain/usecases/remote/auth_remote_usecase.dart';
import 'package:core_project/features/auth/domain/usecases/remote/auth_remote_usecase_implementation.dart';

import 'package:core_project/main.dart';
class ServiceLocators{
  static void setup() {
    getIt.registerSingleton<SettingsLogic>(SettingsLogic());


    getIt.registerSingleton<UserRemoteUsecase>(
      UserRemoteUsecaseImplementation(
        repository: UserRemoteRepositoryImplementation(
          datasource: UserRemoteDatasourceImplementation()
        )
      )
    );

    getIt.registerSingleton<UserLocalUsecase>(
      UserLocalUsecaseImplementation(
        repository: UserLocalRepositoryImplementation(
          datasource: UserLocalDatasourceImplementation()
        )
      )
    );

     getIt.registerSingleton<AuthRemoteUsecase>(
      AuthRemoteUsecaseImplementation(
        repository: AuthRepositoryImplementation(
          datasource: AuthRemoteDatasourceImplementation()
        )
      )
    );

    getIt.registerSingleton<AuthLocalUsecase>(
      AuthLocalUsecaseImplementation(
        repository: AuthLocalRepositoryImplementation(
          datasource: AuthLocalDatasourceImplementation()
        )
      )
    );
  }
}