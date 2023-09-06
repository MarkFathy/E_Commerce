import 'package:e_commerce/auth/presentation/login/cubit/login_cubit.dart';
import 'package:e_commerce/auth/presentation/login/login_screen.dart';
import 'package:e_commerce/auth/presentation/register/register_screen.dart';
import 'package:e_commerce/core/buttons.dart';
import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/components/textfield.dart';
import 'package:e_commerce/core/navigation_const.dart';
import 'package:e_commerce/network/local/cache_helper.dart';
import 'package:e_commerce/shop_layout/layouts/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginItems extends StatelessWidget {
  const LoginItems({super.key});




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>
      (listener: (context,state)
        {
          if(state is LoginSuccessState) {
            if (state.loginModel.status!) {
              print(state.loginModel.message);
              print('the token is: ${state.loginModel.data!.token}');

              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${state.loginModel.message}'),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
              );

              // CacheHelper.saveData(
              //     key: 'token', value: state.loginModel.data?.token).then((
              //     value) {
              //   navigateAndFinish(context, const HomeScreen());
              // });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${state.loginModel.message}'),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 2),
                  )
              );
              print(state.loginModel.message);
            }

            }

        },
      builder: (context,state){
        var cubit=LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        fontSize: 45.sp),
                  ),
                  SizedBox(height: 50.h),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: DefaultTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: cubit.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email Adress Can't be empty";
                        }
                        return null;
                      },
                      hintText: 'Email Adress',
                      onChanged: (value)
                      {
                      },
                    ),
                  ),

                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: DefaultTextField(
                      keyboardType: TextInputType.text,
                      controller: cubit.passController,
                      obsecure: cubit.isSecured,
                      suffix: cubit.togglePass(),
                      hintText: 'Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Cant be empty';
                        } else if (value.length < 5) {
                          return 'Password Cant be less than 5';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value)
                      {
                        if(cubit.formKey.currentState!.validate())
                        {
                          cubit.userLogin(
                            email: cubit.emailController.text,
                            password: cubit.passController.text,
                          );
                          navigateAndFinish(context, HomeScreen());
                        }
                      },
                      onChanged: (value)
                      {
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      0,
                      25,
                      0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: firstColor, fontSize: 12.sp),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  if (state is LoginLoadingState)
                    CircularProgressIndicator(color: firstColor)
                  else
                    FirstBtn(
                      text1: 'LOGIN',
                      onPressed: () {
                        if(cubit.formKey.currentState!.validate())
                          {
                            cubit.userLogin(
                              email: cubit.emailController.text,
                              password: cubit.passController.text,
                            );
                            navigateAndFinish(context, HomeScreen());

                          }

                      },
                    ),
                  SizedBox(height: 30.h),
                  const Text(
                    '- OR -',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 15.h),
                  const Text(
                    'Signin with',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          navigateTo(context, const HomeScreen());
                        },
                        child: CircleAvatar(
                          backgroundImage: const AssetImage('assets/icons/google.png'),
                          radius: 25.r,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      SizedBox(width: 40.w),
                      InkWell(
                        onTap: () {
                          navigateTo(context, const HomeScreen());
                        },
                        child: CircleAvatar(
                          backgroundImage: const AssetImage('assets/icons/face.png'),
                          radius: 25.r,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25).h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, const RegisterScreen());
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: firstColor),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],

              ),

            ),
          ),
        );
      },
    );
  }
}
