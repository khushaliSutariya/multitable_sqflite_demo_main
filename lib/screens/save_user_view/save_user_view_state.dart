part of 'save_user_view.dart';



class SaveUserViewState extends Equatable {
  List<dynamic> saveUserList;
  SaveUserViewState({this.saveUserList = const []});
  @override
  List<Object?> get props => [saveUserList];

  SaveUserViewState copyWith({
    List<dynamic>? saveUserList,
  }) {
    return SaveUserViewState(
      saveUserList: saveUserList ?? this.saveUserList,
    );
  }
}
