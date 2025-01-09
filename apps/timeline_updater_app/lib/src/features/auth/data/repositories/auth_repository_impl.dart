import 'package:timeline_updater_app_utils/timeline_updater_app_utils.dart';

import 'package:timeline_updater_app/src/features/auth/data/dto/profile_dto.dart';
import 'package:timeline_updater_app/src/features/auth/domain/entities/profile_entity.dart';
import 'package:timeline_updater_app/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:timeline_updater_app/src/features/auth/domain/repositories/auth_repository.dart';

/// An implementation of the authentication repository
class AuthRepositoryImpl implements AuthRepository {

  /// The authentication datasource
  final AuthDatasource _authDatasource;

  /// Default constructor
  const AuthRepositoryImpl({
    required AuthDatasource authDatasource
  })  : _authDatasource = authDatasource;

  @override
  FutureResult<void, Object> signIn({
    required String email,
    required String password
  }) async {
    try {
      await _authDatasource.signIn(
        email: email,
        password: password
      );
      return const Success(data: null);
    } catch (e) {
      return Failure(error: e);
    }
  }

  @override
  FutureResult<void, Object> signOut() async {
    try {
      await _authDatasource.signOut();
      return const Success(data: null);
    } catch (e) {
      return Failure(error: e);
    }
  }

  @override
  FutureResult<ProfileEntity, Object> getCurrentProfile() async {
    try {
      final ProfileDto profileDto = await _authDatasource.getCurrentProfile();
      final ProfileEntity profileEntity = profileDto.toEntity();
      return Success(data: profileEntity);
    } catch (e) {
      return Failure(error: e);
    }
  }
}