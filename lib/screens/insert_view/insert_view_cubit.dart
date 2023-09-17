part of 'insert_view.dart';

class InsertViewCubit extends Cubit<InsertViewState> {
  InsertViewCubit(super.initialState);

  void insertData(BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      await obj.insertUsers({
        'name': state.userNameController.text.trim(),
        'phone': state.userPhoneController.text.trim(),
        'email': state.userEmailController.text.trim(),
        'password': state.userPasswordController.text.trim()
      });
      if(context.mounted){
        Navigator.pop(context);
      }
    }



  }
}
