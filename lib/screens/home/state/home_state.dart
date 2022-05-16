

abstract class HomeState{
  HomeState();
}

class HomeSplash extends HomeState {
  int? splashTime;
  HomeSplash({this.splashTime = 1});
}
class HomeLoading extends HomeState{
  HomeLoading();
}
class HomeComplate extends HomeState{
  List<dynamic>? homeModel = [];
  HomeComplate({this.homeModel});
}
class HomeRefresh extends HomeState{
  HomeRefresh();
}
class HomeChangeLocal extends HomeState{
  String? first;
  String? second;
  HomeChangeLocal({this.first,this.second});
}
class HomeError extends HomeState{
  String msg;
  HomeError({required this.msg});
}

