part of 'home_page_view.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit(super.initialState) {
    getUser();
  }

  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var getData = prefs.getString('loginUserData');
    List<dynamic> userData;
    if (jsonDecode(getData!)['id'] != null) {
      userData = (await obj.queryNotAllRows(jsonDecode(getData)['id'].toString()));
    } else {
      userData = (await obj.queryAllRows());
    }
    emit(state.copyWith(allUsers: userData));
  }

  void openInsertView(BuildContext context) {
    Navigator.of(context).pushNamed(InsertView.routeName).then((value) {
      getUser();
    });
  }

  void logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("loginUserData").then((value) {
      Navigator.of(context).pushNamed(MainHomeView.routeName);
    });
  }

  void likeUserInsert(int id, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var getData = prefs.getString('loginUserData');
    var data = await obj.likeUser(id, jsonDecode(getData!)['id']);
    if (data.isEmpty) {
      await obj.insertLikeUser({
        'likeId': jsonDecode(getData)['id'].toString(),
        'userId': id,
      });
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User already like")));
      }
    }
  }

  void saveUserInsert(int id, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var getData = prefs.getString('loginUserData');
    var data = await obj.saveUser(id, jsonDecode(getData!)['id']);
    if (data.isEmpty) {
      await obj.insertSaveUser({
        'saveDataId': jsonDecode(getData)['id'].toString(),
        'saveUserId': id,
      });
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User already save")));
      }
    }
  }
}
