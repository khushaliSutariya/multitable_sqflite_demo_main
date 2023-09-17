import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
part 'save_user_view_cubit.dart';
part 'save_user_view_state.dart';
class SaveUserView extends StatefulWidget {
  const SaveUserView({Key? key}) : super(key: key);
  static const String routeName = '/save_user_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveUserViewCubit(SaveUserViewState()),
      child: const SaveUserView(),
    );
  }

  @override
  State<SaveUserView> createState() => _SaveUserViewState();
}

class _SaveUserViewState extends State<SaveUserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post save")),
      body: BlocBuilder<SaveUserViewCubit,SaveUserViewState>(
        builder: (context, state) {
          return (state.saveUserList.isEmpty)
              ? const Center(child: Text("No Data Found"))
              : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state.saveUserList.length,
              itemBuilder: (context, index) {
                var user = state.saveUserList[index];
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
