part of 'login_view.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  LoginViewCubit(super.initialState);

  void loginData(String email, String password, BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      if (state.userEmailController.text.isNotEmpty || state.userPasswordController.text.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await obj.loginUsers(email, password).then((value) {
          if (value != null) {
            if (context.mounted) {
              prefs.setString("loginUserData", jsonEncode(value));
              Navigator.pushNamed(context, HomePageView.routeName);
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid email or password")));
          }
        });
      }
    }
  }


}
