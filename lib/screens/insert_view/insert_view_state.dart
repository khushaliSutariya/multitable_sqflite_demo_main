part of 'insert_view.dart';

class InsertViewState extends Equatable {
  final TextEditingController userNameController;
  final TextEditingController userPhoneController;
  final TextEditingController userEmailController;
  final TextEditingController userPasswordController;
  final GlobalKey<FormState> formKey;

  const InsertViewState(
      {required this.userNameController,
      required this.userPhoneController,
      required this.userEmailController,
      required this.userPasswordController,required this.formKey});

  @override
  List<Object?> get props => [];

  InsertViewState copyWith({
    TextEditingController? userNameController,
    TextEditingController? userPhoneController,
    TextEditingController? userEmailController,
    TextEditingController? userPasswordController,
    GlobalKey<FormState>? formKey,
  }) {
    return InsertViewState(
      userNameController: userNameController ?? this.userNameController,
      userPhoneController: userPhoneController ?? this.userPhoneController,
      userEmailController: userEmailController ?? this.userEmailController,
      userPasswordController: userPasswordController ?? this.userPasswordController,
      formKey: formKey ?? this.formKey,
    );
  }
}
