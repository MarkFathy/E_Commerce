import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/network/dio_helper.dart';
import 'package:e_commerce/network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isSecured = true;
  Widget togglePass() {
    return IconButton(
      onPressed: () {
        isSecured=!isSecured;
        emit(TogglePasswordState(isSecured));

      },
      icon: isSecured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
  void userRegister(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    emit(RegisterLoadingState());
    try {
      Response? value = await DioHelper.postData(url: REGISTER, data: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
      });
      print(value?.data.toString());
      emit(RegisterSuccessState());
    } catch (error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    }
  }


}
