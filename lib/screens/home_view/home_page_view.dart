import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable_sqflite_demo_main/screens/database/databasehandler.dart';
import 'package:multitable_sqflite_demo_main/screens/favourite_view/favourite_view.dart';
import 'package:multitable_sqflite_demo_main/screens/insert_view/insert_view.dart';
import 'package:multitable_sqflite_demo_main/screens/main_home_view/main_home_view.dart';
import 'package:multitable_sqflite_demo_main/screens/save_user_view/save_user_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

part 'home_view_cubit.dart';

part 'home_view_state.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);
  static const String routeName = '/home_page_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubit(const HomeViewState()),
      child: const HomePageView(),
    );
  }

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, title: const Text("View user data"), actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FavouriteView.routeName);
              },
              icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SaveUserView.routeName);
              },
              icon: const Icon(Icons.save)),
          IconButton(
              onPressed: () {
                context.read<HomeViewCubit>().openInsertView(context);
              },
              icon: const Icon(Icons.insert_invitation)),
          IconButton(
              onPressed: () {
                context.read<HomeViewCubit>().logOut(context);
              },
              icon: const Icon(Icons.logout)),
        ]),
        body: BlocBuilder<HomeViewCubit, HomeViewState>(
          builder: (context, state) {
            return (state.allUsers.isEmpty)
                ? const Center(child: Text("No Data Found"))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: state.allUsers.length,
                      itemBuilder: (context, index) {
                        var user = state.allUsers[index];
                        return Card(
                          color: Colors.grey,
                          child: ListTile(
                            title: Text("Name: ${user["name"]}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user["email"].toString()),
                                Text("phone: ${user["phone"]}"),
                                Text("pass: ${user["password"]}"),
                              ],
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  icon:const Icon(Icons.favorite_border_outlined),
                                  onPressed: () {
                                    context.read<HomeViewCubit>().likeUserInsert(user["id"],context);
                                  },
                                ),
                                IconButton(
                                    onPressed: () {
                                      context.read<HomeViewCubit>().saveUserInsert(user["id"],context);
                                    },
                                    icon: const Icon(Icons.save_outlined)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
          },
        ));
  }
}
