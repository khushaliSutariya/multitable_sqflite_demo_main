part of 'login_view.dart';




class LoginViewState extends Equatable {
  final TextEditingController userEmailController;
  final TextEditingController userPasswordController;
  final bool isLoggedIn;
  final GlobalKey<FormState> formKey;
  const LoginViewState({required this.formKey,this.isLoggedIn = false,required this.userPasswordController,required this.userEmailController});
  @override
  List<Object?> get props => [isLoggedIn];

  LoginViewState copyWith({
    TextEditingController? userEmailController,
    TextEditingController? userPasswordController,
    bool? isLoggedIn,
    GlobalKey<FormState>? formKey,
  }) {
    return LoginViewState(
      userEmailController: userEmailController ?? this.userEmailController,
      userPasswordController: userPasswordController ?? this.userPasswordController,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      formKey: formKey ?? this.formKey,
    );
  }
}
