import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable_sqflite_demo_main/screens/main_home_view/main_home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../home_view/home_page_view.dart';

part 'splash_cubit.dart';
part 'splash_state.dart';
class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);
  static const String routeName = '/splash_screens';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(const SplashState(), context: context,),
      child: const SplashScreens(),
    );
  }

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashCubit,SplashState>(builder: (context, state) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("img/k.png",width: 100.0,height: 100.0),

            ],
          ),
        );
      },),
    );
  }
}
