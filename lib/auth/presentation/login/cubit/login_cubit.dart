import 'package:dio/dio.dart';
import 'package:e_commerce/network/dio_helper.dart';
import 'package:e_commerce/network/end_points.dart';
import 'package:e_commerce/network/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passController=TextEditingController();




  LoginModel? loginModel;

  bool isSecured = true;
  Widget togglePass() {
    return IconButton(
      onPressed: () {
        isSecured=!isSecured;
        emit(TogglePasswordState(isSecured));

      },
      icon: isSecured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
  void userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response? value = await DioHelper.postData(url: LOGIN, data: {
        'email': email,
        'password': password,
      });
      print(value?.data.toString());
      loginModel=LoginModel.fromJson(value!.data);

      emit(LoginSuccessState(loginModel!));
    } catch (error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    }
  }



}


