part of 'favourite_view.dart';



class FavouriteViewState extends Equatable {
  final List<dynamic> likeUserList;
  const FavouriteViewState({this.likeUserList = const []});
  @override
  List<Object?> get props => [likeUserList];

  FavouriteViewState copyWith({
    List<dynamic>? likeUserList,
  }) {
    return FavouriteViewState(
      likeUserList: likeUserList ?? this.likeUserList,
    );
  }
}
