import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable_sqflite_demo_main/screens/home_view/home_page_view.dart';
import 'package:multitable_sqflite_demo_main/screens/login_view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../insert_view/insert_view.dart';

part 'main_home_view_state.dart';

part 'main_home_view_cubit.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({Key? key}) : super(key: key);
  static const String routeName = '/main_home_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => MainHomeViewCubit(MainHomeViewState()),
      child: const MainHomeView(),
    );
  }

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainHomeViewCubit, MainHomeViewState>(
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, InsertView.routeName);
                    },
                    child: const Text("Insert")),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginView.routeName);
                    },
                    child: const Text("Login")),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomePageView.routeName);
                    },
                    child: const Text("View")),
              ],
            ),
          );
        },
      ),
    );
  }
}
