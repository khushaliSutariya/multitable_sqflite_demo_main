import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable_sqflite_demo_main/screens/database/databasehandler.dart';
import 'package:multitable_sqflite_demo_main/screens/favourite_view/favourite_view.dart';
import 'package:multitable_sqflite_demo_main/screens/home_view/home_page_view.dart';
import 'package:multitable_sqflite_demo_main/screens/insert_view/insert_view.dart';
import 'package:multitable_sqflite_demo_main/screens/login_view/login_view.dart';
import 'package:multitable_sqflite_demo_main/screens/main_home_view/main_home_view.dart';
import 'package:multitable_sqflite_demo_main/screens/save_user_view/save_user_view.dart';
import 'package:multitable_sqflite_demo_main/screens/splash/splash_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

DatabaseHandler obj = DatabaseHandler();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: SplashScreens.routeName,
        routes: routes,
        home: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => SplashCubit(const SplashState(), context: context),
          ),
          BlocProvider(
            create: (context) => HomeViewCubit(const HomeViewState()),
          ),
        ], child: const SplashScreens()));
  }

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        SplashScreens.routeName: SplashScreens.builder,
        MainHomeView.routeName: MainHomeView.builder,
        InsertView.routeName: InsertView.builder,
        LoginView.routeName: LoginView.builder,
        HomePageView.routeName: HomePageView.builder,
        FavouriteView.routeName: FavouriteView.builder,
        SaveUserView.routeName: SaveUserView.builder,
      };
}
