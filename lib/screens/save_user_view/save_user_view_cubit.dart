part of 'save_user_view.dart';


class SaveUserViewCubit extends Cubit<SaveUserViewState> {
  SaveUserViewCubit(super.initialState){fetchSaveData();}

  void fetchSaveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginId = prefs.getString('loginUserData');
    List<dynamic> saveData = await obj.getUsersWithSaves(jsonDecode(loginId!)['id']);
    emit(state.copyWith(saveUserList:  saveData));
  }
}
