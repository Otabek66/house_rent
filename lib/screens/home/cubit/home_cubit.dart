import 'package:bloc/bloc.dart';

// class HomeCubit extends Cubit<HomeState>{
//   HomeCubit() : super(HomeSplash());


// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:easyloca/models/home_model.dart';
// import 'package:gohome/screens/home/state/home_state.dart';
import 'dart:convert';

import 'package:flutter/services.dart' as bundle;
import 'package:travelrent/screens/home/state/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeSplash());


  static List? globalList;
  Future<List>? getData() async {
    emit(HomeLoading());
    try {
      final data =
          await bundle.rootBundle.loadString('lib/mock/mock_data.json');
      print(data);
      final list = jsonDecode(data) as List;
      print(list.toString());

      emit(HomeComplate(homeModel: list));
      globalList = list;
      return list;
      
    } catch (e) {
      emit(HomeError(msg: "Ma'lumot kelishida xatolik"));
      return [];
    }
  }

  void changeLocalization(BuildContext context,String first, String second){
    context.setLocale(Locale(first, second.toUpperCase()));
    emit(HomeChangeLocal(first: first, second: second.toUpperCase()));
    emit(HomeComplate(homeModel: globalList));
  }
}