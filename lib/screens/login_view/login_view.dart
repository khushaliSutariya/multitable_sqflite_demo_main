import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable_sqflite_demo_main/screens/database/databasehandler.dart';
import 'package:multitable_sqflite_demo_main/screens/home_view/home_page_view.dart';
import 'package:multitable_sqflite_demo_main/screens/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

part 'login_view_cubit.dart';

part 'login_view_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const String routeName = '/login_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginViewCubit(LoginViewState(formKey: GlobalKey<FormState>(),
          userPasswordController: TextEditingController(), userEmailController: TextEditingController())),
      child: const LoginView(),
    );
  }

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login user")),
      body: BlocBuilder<LoginViewCubit, LoginViewState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: state.formKey,
                child: Column(
                  children: [
                    const Text("User email"),
                    CustomTxtField(
                      hintText: "User email",
                      user: state.userEmailController,
                      validator: (email) {
                        if (email!.length <= 0) {
                          return "Please enter your email";
                        } else {
                          bool emailValid = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(email);
                          if (!emailValid) {
                            return "Please enter your valid email";
                          }
                        }
                        return null;
                      },
                    ),
                    const Text("UserPassword"),
                    const SizedBox(
                      height: 3.0,
                    ),
                    CustomTxtField(
                      hintText: "User password",
                      user: state.userPasswordController,
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "Please enter your password";
                        } else {
                          bool fullNameValid = RegExp(r'[a-z]').hasMatch(password);
                          if (!fullNameValid) {
                            return "Please enter your valid password";
                          }
                        }
                        return null;
                      },
                    ), const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginViewCubit>().loginData(state.userEmailController.text, state.userPasswordController.text,context);
                      },
                      child: const Text("Login"),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
