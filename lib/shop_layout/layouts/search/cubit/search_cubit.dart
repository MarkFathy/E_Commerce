import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utilis/constants.dart';
import 'package:e_commerce/network/dio_helper.dart';
import 'package:e_commerce/network/end_points.dart';
import 'package:e_commerce/network/models/search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;
  void search(String text)
  {
    emit(SearchLoadingState());
    DioHelper.postData(url: SEARCH,token: token, data: {
      'text':text
    }).then((value) {
      searchModel=SearchModel.fromJson(value!.data);
      emit(SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState());
    });
  }


}
