import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitable_sqflite_demo_main/screens/home_view/home_page_view.dart';
import 'package:multitable_sqflite_demo_main/screens/widgets/custom_text_field.dart';

import '../../main.dart';

part 'insert_view_state.dart';

part 'insert_view_cubit.dart';

class InsertView extends StatefulWidget {
  const InsertView({Key? key}) : super(key: key);
  static const String routeName = '/insert_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => InsertViewCubit(InsertViewState(
          userNameController: TextEditingController(),
          userEmailController: TextEditingController(),
          userPasswordController: TextEditingController(),
          userPhoneController: TextEditingController(),formKey: GlobalKey<FormState>())),
      child: const InsertView(),
    );
  }

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Insert user")),
      body: BlocBuilder<InsertViewCubit, InsertViewState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: state.formKey,
                child: Column(
                  children: [
                    const Text("Username"),
                    const SizedBox(
                      height: 3.0,
                    ),
                    CustomTxtField(
                      hintText: "User name",
                      user: state.userNameController,
                      validator: (userName) {
                        if (userName!.isEmpty) {
                          return "Please enter your user name";
                        } else {
                          bool fullNameValid = RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(userName);
                          if (!fullNameValid) {
                            return "Please enter your valid user name";
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text("Userphone"),
                    const SizedBox(
                      height: 3.0,
                    ),
                    CustomTxtField(
                      hintText: "User phone",
                      user: state.userPhoneController,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return "Please enter your phone number";
                        } else {
                          bool fullNameValid = RegExp(r'^\+?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}$').hasMatch(phone);
                          if (!fullNameValid) {
                            return "Please enter your valid phone number";
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text("UserEmail"),
                    const SizedBox(
                      height: 3.0,
                    ),
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
                    //Vignesh123! : true
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
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        debugPrint("OnPressed");
                        context.read<InsertViewCubit>().insertData(context);
                      },
                      child: const Text("Save"),
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
