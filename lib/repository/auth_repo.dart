import 'package:al_fifa/api/auth_api.dart';
import 'package:al_fifa/models/forgot_password_model.dart';
import 'package:al_fifa/models/login_model.dart';
import 'package:al_fifa/models/profile_model.dart';
import 'package:al_fifa/models/profile_update_model.dart';
import 'package:al_fifa/models/register_model.dart';
import 'package:al_fifa/models/reset_password_model.dart';

class AuthRepository {
  final _authApiProvider = AuthApiProvider();

  Future<RegisterModelResponse> registerUser({required Map body}) async {
    var a = await _authApiProvider.registerUser(body: body);
    return a;
  }
  Future<LoginModelResponse> loginUser({required Map body}) async {
    var a = await _authApiProvider.loginUser(body: body);
    return a;
  }
    Future<ForgotPasswordResponse> userForgotPasssword(
      {required Map body}) async {
    var a = await _authApiProvider.forgotUserPassword(body: body);
    return a;
  }
    Future<UserDetailsModelResponse> getUsersDetails({required Map body}) async {
    var a = await _authApiProvider.userDetails(body: body);
    return a;
  }
 Future<UserDetailsUpdateModelResponse> updateUsersDetails({required Map body}) async {
    return await _authApiProvider.updateUserDetails(body: body);
  }

    Future<ChangePasswordModelResponse> changeUserPassword({required Map body}) async {
    return await _authApiProvider.changePassword(body: body);
  }
}
