part of 'home_page_view.dart';




class HomeViewState extends Equatable {
  final List<dynamic> allUsers;
  final bool isSelected;

  const HomeViewState({this.allUsers = const [],this.isSelected = false});
  @override
  List<Object?> get props => [allUsers];

  HomeViewState copyWith({
    List<dynamic>? allUsers,
    bool? isSelected,
  }) {
    return HomeViewState(
      allUsers: allUsers ?? this.allUsers,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
