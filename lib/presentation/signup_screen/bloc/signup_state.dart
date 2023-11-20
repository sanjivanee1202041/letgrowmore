// ignore_for_file: must_be_immutable

part of 'signup_bloc.dart';

/// Represents the state of Signup in the application.
class SignupState extends Equatable {
  SignupState({
    this.fullNameController,
    this.emailController,
    this.passwordController,
    this.signupModelObj,
  });

  TextEditingController? fullNameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  SignupModel? signupModelObj;

  @override
  List<Object?> get props => [
        fullNameController,
        emailController,
        passwordController,
        signupModelObj,
      ];
  SignupState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      fullNameController: fullNameController ?? this.fullNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}
