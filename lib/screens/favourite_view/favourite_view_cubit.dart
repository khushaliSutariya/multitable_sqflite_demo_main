

part of 'favourite_view.dart';

class FavouriteViewCubit extends Cubit<FavouriteViewState> {
  FavouriteViewCubit(super.initialState) {
    fetchLikeData();
  }


  void fetchLikeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginId = prefs.getString('loginUserData');
    List<dynamic> postData = await obj.getUsersWithLikes(jsonDecode(loginId!)['id']);
    // Set set = {};
    // List<dynamic> uniqueUser = postData.where((value)=> set.add(value['userId'])).toList();
    // postData.forEach((element) {
    //   print("elemet ======= ${element['postId']}");
    // });
emit(state.copyWith(likeUserList: postData));
  }
}
