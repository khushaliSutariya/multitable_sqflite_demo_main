
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

part 'favourite_view_cubit.dart';

part 'favourite_view_state.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({Key? key}) : super(key: key);
  static const String routeName = '/favourite_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteViewCubit(const FavouriteViewState(),),
      child: const FavouriteView(),
    );
  }

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Post like")),
      body: BlocBuilder<FavouriteViewCubit, FavouriteViewState>(
        builder: (context, state) {
          return (state.likeUserList.isEmpty)
              ? const Center(child: Text("No Data Found"))
              : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state.likeUserList.length,
              itemBuilder: (context, index) {
                var user = state.likeUserList[index];
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
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
