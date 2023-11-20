// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.userIdController,
    this.passwordController,
    this.loginModelObj,
  });

  TextEditingController? userIdController;

  TextEditingController? passwordController;

  LoginModel? loginModelObj;

  @override
  List<Object?> get props => [
        userIdController,
        passwordController,
        loginModelObj,
      ];
  LoginState copyWith({
    TextEditingController? userIdController,
    TextEditingController? passwordController,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      userIdController: userIdController ?? this.userIdController,
      passwordController: passwordController ?? this.passwordController,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
