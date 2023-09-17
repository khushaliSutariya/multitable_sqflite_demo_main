part of 'splash_screens.dart';


class SplashCubit extends Cubit<SplashState> {
  BuildContext context;
  SplashCubit(super.initialState,{required this.context}){resetNewLaunch();}

  void resetNewLaunch() async {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString("loginUserData");
      if(prefs.containsKey("loginUserData")){
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed(HomePageView.routeName);
        }
      } else {
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed(MainHomeView.routeName);
        }
      }
    });
  }

}
