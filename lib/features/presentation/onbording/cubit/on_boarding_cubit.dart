import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitial());
  static OnBoardingCubit get(context)=>BlocProvider.of(context);

   setIsLast() {
    bool isLast=true;
    emit(OnBoardingIsLast(isLast));

  }




}
